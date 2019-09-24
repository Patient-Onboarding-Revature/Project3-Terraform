resource "google_sql_database" "database" {
    name = "patient-onboarding-database"
    instance = "${google_sql_database_instance.uat_database.name}"
}

resource "google_sql_database_instance" "uat_database" {
    name = "${var.database_name}"
    database_version = "${var.database_version}"
    region = var.region
    
    settings {
        tier = "${var.database_tier}"
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

/*
resource "google_sql_user" "uat_database_user" {
  name = "host-user"
  instance = "${google_sql_database_instance.uat_database.name}"
  host = "postgres"
  password = "ertyuiop"
}
*/