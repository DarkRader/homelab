module "ld_superuser_password" {
  source         = "../modules/secret"
  secret_id      = "LD_SUPERUSER_PASSWORD"
  manage_version = false
}

module "linkding_db_password" {
  source         = "../modules/secret"
  secret_id      = "LINKDING_DB_PASSWORD"
  manage_version = false
}

module "linkding_oidc_client_secret" {
  source         = "../modules/secret"
  secret_id      = "LINKDING_OIDC_CLIENT_SECRET"
  manage_version = false
}

module "zitadel_admin_password" {
  source         = "../modules/secret"
  secret_id      = "ZITADEL_ADMIN_PASSWORD"
  manage_version = false
}

module "zitadel_db_password" {
  source         = "../modules/secret"
  secret_id      = "ZITADEL_DB_PASSWORD"
  manage_version = false
}

module "zitadel_masterkey" {
  source         = "../modules/secret"
  secret_id      = "ZITADEL_MASTERKEY"
  manage_version = false
}
