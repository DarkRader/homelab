import {
  to = module.ld_superuser_password.google_secret_manager_secret.this
  id = "projects/homelab-514120/secrets/LD_SUPERUSER_PASSWORD"
}

import {
  to = module.linkding_db_password.google_secret_manager_secret.this
  id = "projects/homelab-514120/secrets/LINKDING_DB_PASSWORD"
}

import {
  to = module.linkding_oidc_client_secret.google_secret_manager_secret.this
  id = "projects/homelab-514120/secrets/LINKDING_OIDC_CLIENT_SECRET"
}

import {
  to = module.zitadel_admin_password.google_secret_manager_secret.this
  id = "projects/homelab-514120/secrets/ZITADEL_ADMIN_PASSWORD"
}

import {
  to = module.zitadel_db_password.google_secret_manager_secret.this
  id = "projects/homelab-514120/secrets/ZITADEL_DB_PASSWORD"
}

import {
  to = module.zitadel_masterkey.google_secret_manager_secret.this
  id = "projects/homelab-514120/secrets/ZITADEL_MASTERKEY"
}
