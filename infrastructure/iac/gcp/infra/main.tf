resource "google_secret_manager_secret" "ci_smoke_test" {
  secret_id = "ci-pipeline-smoke-test"

  replication {
    auto {}
  }

  labels = {
    managed-by = "terraform"
    purpose    = "ci-verification"
  }
}

output "smoke_test_secret_id" {
  value = google_secret_manager_secret.ci_smoke_test.id
}
