# Service account used by CloudNativePG Barman plugin to backup databases to GCS
resource "google_service_account" "cnpg_backup" {
  account_id   = "cnpg-backup"
  display_name = "CloudNativePG Backup Service Account"
  description  = "Used by CloudNativePG Barman plugin to archive WAL and backup PostgreSQL databases to GCS"
}

# Grant objectAdmin on the Linkding backup bucket
resource "google_storage_bucket_iam_member" "cnpg_backup_linkding" {
  bucket = module.cnpg_backup_linkding.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.cnpg_backup.email}"
}

# Grant objectAdmin on the Zitadel backup bucket
resource "google_storage_bucket_iam_member" "cnpg_backup_zitadel" {
  bucket = module.cnpg_backup_zitadel.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.cnpg_backup.email}"
}

# Generate service account key
resource "google_service_account_key" "cnpg_backup" {
  service_account_id = google_service_account.cnpg_backup.name
}

# Store the JSON key in Secret Manager for External Secrets to sync to Kubernetes
module "cnpg_backup_sa_key" {
  source         = "../modules/secret"
  secret_id      = "CNPG_BACKUP_SA_KEY"
  value          = base64decode(google_service_account_key.cnpg_backup.private_key)
  manage_version = true

  labels = {
    managed-by = "terraform"
    purpose    = "cnpg-backup"
  }
}
