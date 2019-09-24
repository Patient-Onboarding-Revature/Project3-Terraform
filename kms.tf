resource "google_kms_key_ring" "global_keyring" {
    name = "${var.keyring_name}"
    location = "global"
}

resource "google_kms_crypto_key" "encryption_key" {
    name = "${var.key_name}"
    key_ring = "${google_kms_key_ring.global_keyring.self_link}"

    purpose = "ENCRYPT_DECRYPT"

    lifecycle {
        prevent_destroy = true
    }

    labels = {
        environment = "uat"
    }
}