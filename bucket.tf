resource "google_storage_bucket" "angular-page" {
    name     = "patient-onboarding-page"
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
