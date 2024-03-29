  resource "null_resource" "enable-api" {
  # Execute always
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<-EOT
        gcloud services enable secretmanager.googleapis.com
        gcloud services enable sqladmin.googleapis.com

    EOT
  }
}



resource "random_password" "password" {
  length = 16
  special = false
}

resource "google_sql_database_instance" "default" {
  name                 = var.instance_name
  database_version     = var.database_version
  region               = var.region
  deletion_protection  = var.deletion_protection
  root_password        = random_password.password.result

  settings {
    tier         = var.tier
    disk_size    = var.disk_size
    disk_type    = var.disk_type
  }

  lifecycle {
    ignore_changes = [
      settings[0].disk_size
    ]
  }
}


resource "google_sql_database" "default" {
  name       = var.db_name
  instance   = google_sql_database_instance.default.name
  charset    = var.db_charset
  collation  = "utf8_general_ci"
  depends_on = [google_sql_database_instance.default]
}

