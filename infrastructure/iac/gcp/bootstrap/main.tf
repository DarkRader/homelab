terraform {
  required_version = "1.17.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
  }
}

variable "project_id" {
  type = string
}

variable "github_org" {
  type        = string
  description = "GitHub username or organization name"
}

variable "github_repo" {
  type        = string
  description = "Repository name"
}

provider "google" {
  project = var.project_id
}

# 1. Enable required core & workload APIs
resource "google_project_service" "apis" {
  for_each = toset([
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "storage.googleapis.com",
    "secretmanager.googleapis.com",
  ])
  service            = each.value
  disable_on_destroy = false
}

# 2. Remote State Bucket with Versioning & Uniform Access
resource "google_storage_bucket" "tf_state" {
  name                        = "${var.project_id}-tf-state"
  location                    = "EU"
  force_destroy               = false
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  depends_on = [google_project_service.apis]
}

# 3. Workload Identity Pool & GitHub OIDC Provider
resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = "github-actions-pool"
  display_name              = "GitHub Actions Pool"
  depends_on                = [google_project_service.apis]
}

resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-oidc"
  display_name                       = "GitHub OIDC Provider"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "attribute.ref"        = "assertion.ref"
  }

  # Reject any token that does not originate from your specific repository
  attribute_condition = "assertion.repository == '${var.github_org}/${var.github_repo}'"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# 4. Separate Service Accounts: Read-Only Planner vs. Privileged Applier
resource "google_service_account" "tf_planner" {
  account_id   = "terraform-planner"
  display_name = "Terraform PR Planner (Read-Only)"
}

resource "google_service_account" "tf_applier" {
  account_id   = "terraform-applier"
  display_name = "Terraform Main Applier (Write)"
}

# Planner IAM: Read-only project access + state lock access
resource "google_project_iam_member" "planner_roles" {
  for_each = toset([
    "roles/viewer",
    "roles/iam.securityReviewer",
    "roles/secretmanager.viewer",
  ])
  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.tf_planner.email}"
}

resource "google_storage_bucket_iam_member" "planner_state" {
  bucket = google_storage_bucket.tf_state.name
  role   = "roles/storage.objectAdmin" # Needed to acquire .tflock during plan
  member = "serviceAccount:${google_service_account.tf_planner.email}"
}

# Applier IAM: Scoped to Secret Manager, GCS Buckets, and K3s WIF/Service Accounts
resource "google_project_iam_member" "applier_roles" {
  for_each = toset([
    "roles/secretmanager.admin",
    "roles/storage.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/iam.workloadIdentityPoolAdmin",
    "roles/resourcemanager.projectIamAdmin",
  ])
  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.tf_applier.email}"
}

resource "google_storage_bucket_iam_member" "applier_state" {
  bucket = google_storage_bucket.tf_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.tf_applier.email}"
}

# 5. Bind GitHub OIDC Identities to Service Accounts
# Any workflow in the repo can impersonate the read-only planner
resource "google_service_account_iam_member" "wif_planner" {
  service_account_id = google_service_account.tf_planner.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.github_org}/${var.github_repo}"
}

# ONLY runs on refs/heads/main can impersonate the write applier
resource "google_service_account_iam_member" "wif_applier" {
  service_account_id = google_service_account.tf_applier.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/subject/repo:${var.github_org}/${var.github_repo}:ref:refs/heads/main"
}

output "wif_provider_name" {
  value = google_iam_workload_identity_pool_provider.github.name
}

output "planner_sa_email" {
  value = google_service_account.tf_planner.email
}

output "applier_sa_email" {
  value = google_service_account.tf_applier.email
}

output "state_bucket_name" {
  value = google_storage_bucket.tf_state.name
}
