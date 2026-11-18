resource "google_storage_bucket" "this" {
  name                        = var.name
  location                    = var.location
  storage_class               = var.storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  labels                      = var.labels

  versioning {
    enabled = var.versioning
  }

  soft_delete_policy {
    retention_duration_seconds = var.soft_delete_retention_seconds
  }

  dynamic "lifecycle_rule" {
    for_each = var.retention_days != null ? [1] : []
    content {
      condition {
        age = var.retention_days
      }
      action {
        type = "Delete"
      }
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.noncurrent_retention_days != null ? [1] : []
    content {
      condition {
        days_since_noncurrent_time = var.noncurrent_retention_days
      }
      action {
        type = "Delete"
      }
    }
  }
}
