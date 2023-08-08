resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "${var.project_id}-vpc"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"] # You can restrict this to specific IP ranges for security
  target_tags   = ["allow-ssh"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "${var.project_id}-vpc"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"] # You can restrict this to specific IP ranges for security
}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = "${var.project_id}-vpc"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"] # You can restrict this to specific IP ranges for security
  target_tags   = ["allow-https"]
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = "${var.project_id}-vpc"
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = ["10.10.0.0/24"]
}

resource "google_compute_firewall" "allow_jenkins" {
  name    = "allow-jenkins"
  network = "${var.project_id}-vpc"
  allow {
    protocol = "tcp"
    ports    = ["8089"]
  }
  source_ranges = ["0.0.0.0/0"]
}