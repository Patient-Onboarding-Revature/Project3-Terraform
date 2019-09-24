resource "google_storage_bucket" "static-page" {
    name     = "${var.bucket_name}"
    location = "US"

    cors {
        origin = ["*"]
        method = ["GET", "OPTIONS"]
    }

    labels = {
        environment = "uat"
        application = "front"
    }
}
