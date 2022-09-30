terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
}

resource "google_compute_firewall" "allow-https-only-firewall" {
project     = "winter-charmer-363215"
name = "allow-https-only-firewall"
network="default"
allow {
   protocol = "tcp"
   ports = ["443"]
          }
   source_tags = ["web"]
   source_ranges = ["0.0.0.0/0"]
}