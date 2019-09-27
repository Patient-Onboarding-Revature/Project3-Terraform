provider "google" {
    version = "2.12.0"
    project = var.project_id
    region = var.region
    zone = var.zone
}

resource "google_project" "patient_onboarding" {
    name = "P3 Patient Onboarding"
    project_id = var.project_id
}
