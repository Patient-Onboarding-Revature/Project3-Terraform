resource "google_sql_database" "database" {
    name = "my-database"
    instance = "${google_sql_database_instance.uat_database.name}"
}

resource "google_sql_database_instance" "uat_database" {
    name = "temp-db"
    database_version = "POSTGRES_9_6"
    region = var.region
    
    settings {
        tier = "db-f1-micro"
        availability_type = "ZONAL"
        ip_configuration {
            ipv4_enabled = true
            dynamic "authorized_networks" {
                for_each = var.authorized_networks_to_database
                content {
                    name = authorized_networks.value.name
                    value = authorized_networks.value.value
                }
            }
        }
    }
}

resource "google_sql_user" "uat_database_user" {
  name = "host-user"
  instance = "${google_sql_database_instance.uat_database.name}"
  host = "postgres"
  password = "ertyuiop"
}
