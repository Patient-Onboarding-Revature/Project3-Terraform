output "database_ip" {
    value = google_sql_database_instance.uat_database.ip_address.0.ip_address
}

output "database_name" {
    value = google_sql_database_instance.uat_database.connection_name
}
