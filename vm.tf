resource "google_compute_instance" "vm_instance" {
  name         = "my-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
 
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }
  
 
  network_interface {
    network    = google_compute_network.custom_vpc.name
    subnetwork = google_compute_subnetwork.custom_subnet.name
    access_config {} # public IP
  }
 
  metadata = {
    ssh-keys = "your-username:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
  }
}
