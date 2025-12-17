resource "google_storage_bucket" "my_bucket" {
  name          = "my-unique-bucket-2025"
  location      = "US"
  force_destroy = true
}
