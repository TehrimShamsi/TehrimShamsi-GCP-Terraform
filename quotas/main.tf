terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

output "instance_ips" {
  description = "Internal and external IPs of created instances"
  value = {
    for instance in google_compute_instance.instances : instance.name => {
      internal_ip = instance.network_interface[0].network_ip
      external_ip = instance.network_interface[0].access_config[0].nat_ip
    }
  }
}

output "instance_names" {
  description = "Names of all created instances"
  value       = [for instance in google_compute_instance.instances : instance.name]
}