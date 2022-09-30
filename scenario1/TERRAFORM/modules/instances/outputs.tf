output "instance_name" {
  value       = google_compute_instance.pk_instance.name
  description = "The name of the first vm being created"
}
output "external_ip" {
  value = google_compute_instance.pk_instance.network_interface[0].access_config[0].nat_ip
}