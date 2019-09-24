data "template_file" "jenkins_startup_script" {
    template = "${file("${path.module}/resources/${var.jenkins_startup_script}")}"
}

resource "google_compute_instance" "devops_bastion" {
    name = "bastion"
    machine_type = "f1-micro"
    zone = var.zone
    tags = ["bastion"]
    allow_stopping_for_update = true

    boot_disk {
        auto_delete = true
        initialize_params {
            image = "centos-7"
        }
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.uat_subnetwork.self_link}"
        access_config {
            network_tier = "STANDARD"
        }
    }
}

resource "google_compute_instance" "jenkins_vm" {
    name = "jenkins-server"
    machine_type = "n1-standard-1"
    zone = var.zone
    tags = ["http-server", "https-server", "jenkins", "server"]
    allow_stopping_for_update = true

    labels = {
        environment = "uat"
    }

    boot_disk {
        auto_delete = true
        initialize_params {
            image = "centos-7"
        }
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.uat_subnetwork.self_link}"
        access_config {
            network_tier = "STANDARD"
        }
    }

    service_account {
        scopes = ["cloud-platform"]
    }

    metadata_startup_script = "${data.template_file.jenkins_startup_script.rendered}"
}

resource "google_compute_instance_iam_binding" "jenkins-binding" {
  instance_name = "${google_compute_instance.jenkins_vm.name}"
  role = "roles/custom.jenkinsUAT"

  members = [
    "allAuthenticatedUsers",
  ]

  depends_on = [
      google_project_iam_custom_role.jenkins-role,
  ]
}