variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

resource "google_compute_instance" "instances" {
  count = 24

  name         = "instance-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["terraform", "e2-micro"]
}