resource "google_compute_instance" "jenkins_vm" {
  name         = "jenkins-vm"
  machine_type = "n1-standard-4"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2304-lunar-amd64-v20230725"
    }
  }

  network_interface {
    network    = "${var.project_id}-vpc"
    subnetwork = "${var.project_id}-subnet"
    access_config {
      // Ephemeral IP
    }
  }

  tags = ["allow-ssh", "allow-http", "allow-https", "allow-internal", "allow-jenkins"]

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo su
    apt-get update
    apt upgrade -y
    jenkins --httpPort=8089
    EOT
}