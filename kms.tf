resource "google_kms_key_ring" "patient_onboarding_keyring" {
    name = "po-keyring"
    location = "global"
}

resource "google_kms_crypto_key" "patient_onboarding_key" {
    name = "po-key"
    key_ring = "${google_kms_key_ring.patient_onboarding_keyring.self_link}"

    purpose = "ENCRYPT_DECRYPT"

    lifecycle {
        prevent_destroy = true
    }

    labels = {
        environment = "uat"
    }
}