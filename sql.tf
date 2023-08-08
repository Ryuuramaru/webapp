resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "my-database-instance"
  region           = "europe-west3"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"

    //backup
    backup_configuration {
      enabled = true
      start_time = "00:00"
    }
  }

  deletion_protection  = "true"
}