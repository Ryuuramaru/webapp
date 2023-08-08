resource "google_compute_instance" "ansible_vm" {
  name         = "ansible-vm"
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
  }

  tags = ["allow-ssh"]

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get upgrade -y
    apt-get install -y python3 pip
    pip install ansible
    EOT
}

