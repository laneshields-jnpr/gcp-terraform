output "router_int1_address" {
  description = "The IP address of the first interface of the GCP router"
  value       = google_compute_router_interface.router_int1.private_ip_address
}

output "router_int1_name" {
  description = "The name of the first interface of the GCP router, used by other modules"
  value       = google_compute_router_interface.router_int1.name
}

output "router_int2_address" {
  description = "The IP address of the seconde interface of the GCP router"
  value       = google_compute_router_interface.router_int2.private_ip_address
}

output "router_int2_name" {
  description = "The name of the second interface of the GCP router, used by other modules"
  value       = google_compute_router_interface.router_int2.name
}

output "router_name" {
  description = "The name of the GCP router, used by other modules"
  value       = google_compute_router.router.name
}