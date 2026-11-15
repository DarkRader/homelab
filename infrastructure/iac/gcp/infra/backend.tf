terraform {

  backend "gcs" {
    bucket = "homelab-514120-tf-state"
    prefix = "gcp/infra"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
  }
}

provider "google" {
  project = "homelab-514120"
  region  = "europe-west3"
}
