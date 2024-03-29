output "name" {
  value       = google_sql_database_instance.default.name
  description = "The name for Cloud SQL instance"
}

output "mysql_conn" {
  value       = google_sql_database_instance.default.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "pub_IP" {
  value       = google_sql_database_instance.default.public_ip_address
  description = "The IP of the master instance to be used in public connection"
}