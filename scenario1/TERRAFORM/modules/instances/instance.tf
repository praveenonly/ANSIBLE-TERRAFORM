resource "google_compute_instance" "pk_instance" {
  name         = var.instance_name
  machine_type = "f1-micro"
  tags = ["http-server","https-server","web"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = "default"
    access_config {
        // Ephemeral public IP
    }
              }
        metadata_startup_script = file("${path.module}/script.sh")
    
}
resource "google_compute_firewall" "allow_http_https" {
name = "allow-http-https-rule"
network="default"
allow {
   protocol = "tcp"
   ports = ["443","80"]
          }
   target_tags = ["http-server","https-server","web"]
   source_ranges = ["0.0.0.0/0"]
}