module "ld_superuser_password" {
  source         = "../modules/secret"
  secret_id      = "LD_SUPERUSER_PASSWORD"
  manage_version = false

  labels = {
    managed-by = "terraform"
    app        = "linkding"
  }
}

module "linkding_db_password" {
  source         = "../modules/secret"
  secret_id      = "LINKDING_DB_PASSWORD"
  manage_version = false

  labels = {
    managed-by = "terraform"
    app        = "linkding"
  }
}

module "linkding_oidc_client_secret" {
  source         = "../modules/secret"
  secret_id      = "LINKDING_OIDC_CLIENT_SECRET"
  manage_version = false

  labels = {
    managed-by = "terraform"
    app        = "linkding"
  }
}

module "zitadel_admin_password" {
  source         = "../modules/secret"
  secret_id      = "ZITADEL_ADMIN_PASSWORD"
  manage_version = false

  labels = {
    managed-by = "terraform"
    app        = "zitadel"
  }
}

module "zitadel_db_password" {
  source         = "../modules/secret"
  secret_id      = "ZITADEL_DB_PASSWORD"
  manage_version = false

  labels = {
    managed-by = "terraform"
    app        = "zitadel"
  }
}

module "zitadel_masterkey" {
  source         = "../modules/secret"
  secret_id      = "ZITADEL_MASTERKEY"
  manage_version = false

  labels = {
    managed-by = "terraform"
    app        = "zitadel"
  }
}

module "n8n_db_password" {
  source         = "../modules/secret"
  secret_id      = "N8N_DB_PASSWORD"
  manage_version = true

  generate = {
    method = "base64"
    length = 32
  }

  labels = {
    managed-by = "terraform"
    app        = "n8n"
  }
}

module "n8n_encryption_key" {
  source         = "../modules/secret"
  secret_id      = "N8N_ENCRYPTION_KEY"
  manage_version = true

  generate = {
    method = "base64"
    length = 32
  }

  labels = {
    managed-by = "terraform"
    app        = "n8n"
  }
}
