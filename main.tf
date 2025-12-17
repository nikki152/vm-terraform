provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
  zone    = "us-central1-a"
}

 
# Custom VPC
resource "google_compute_network" "custom_vpc" {
  name                    = "my-custom-vpc"
  auto_create_subnetworks = false
}
 
resource "google_compute_subnetwork" "custom_subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.custom_vpc.id
  region        = "us-central1"
}

 
# Firewall
resource "google_compute_firewall" "allow_ssh_http" {
  name    = "allow-ssh-http"
  network = google_compute_network.custom_vpc.name
 
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
 
  source_ranges = ["0.0.0.0/0"]
}
