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
    apt-get update
    apt-get upgrade -y
    apt install default-jre  # Install Java (if not already installed)
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    apt update
    apt install jenkins
    apt-get install -y lsb-release
    curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg
    echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
    apt-get update && apt-get install -y --fix-missing git nodejs npm docker-ce python3 python3-pip software-properties-common
    pip install ansible
    EOT
}