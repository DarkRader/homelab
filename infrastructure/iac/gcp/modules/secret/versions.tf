terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}
