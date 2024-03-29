resource "google_secret_manager_secret" "db_secert" {
  secret_id = "db_password"

    labels = {
    label = "mysql"
  }
  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }

}


resource "google_secret_manager_secret_version" "secret-version" {
  secret      = google_secret_manager_secret.db_secert.id
  secret_data = random_password.password.result
}