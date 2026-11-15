resource "random_password" "this" {
  count   = var.manage_version && var.generate != null && var.generate.method == "password" ? 1 : 0
  length  = var.generate.length
  special = var.generate.special
}

resource "random_bytes" "this" {
  count  = var.manage_version && var.generate != null && contains(["bytes", "base64", "hex"], var.generate.method) ? 1 : 0
  length = var.generate.length
}

locals {
  resolved_value = !var.manage_version ? null : (
    var.value != null ? var.value :
    var.generate.method == "password" ? random_password.this[0].result :
    var.generate.method == "hex" ? random_bytes.this[0].hex :
    random_bytes.this[0].base64
  )
}

resource "google_secret_manager_secret" "this" {
  secret_id = var.secret_id
  labels    = var.labels

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "this" {
  count                  = var.manage_version ? 1 : 0
  secret                 = google_secret_manager_secret.this.id
  secret_data_wo         = local.resolved_value
  secret_data_wo_version = 1
}
