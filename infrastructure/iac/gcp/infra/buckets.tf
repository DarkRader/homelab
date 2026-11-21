module "cnpg_backup_zitadel" {
  source         = "../modules/bucket"
  name           = "zitadel-cnpg-backup"
  location       = "EUROPE-WEST3"
  retention_days = 30

  labels = {
    managed-by = "terraform"
    app        = "zitadel"
    purpose    = "cnpg-backup"
  }
}

module "cnpg_backup_linkding" {
  source         = "../modules/bucket"
  name           = "linkding-cnpg-backup"
  location       = "EUROPE-WEST3"
  retention_days = 30

  labels = {
    managed-by = "terraform"
    app        = "linkding"
    purpose    = "cnpg-backup"
  }
}

module "cnpg_backup_n8n" {
  source         = "../modules/bucket"
  name           = "n8n-cnpg-backup"
  location       = "EUROPE-WEST3"
  retention_days = 30

  labels = {
    managed-by = "terraform"
    app        = "n8n"
    purpose    = "cnpg-backup"
  }
}
