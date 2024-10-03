output "external_subnet_gateway" {
  description = "The IP address assigned by GCP for the gateway of the external subnet"
  value       = google_compute_subnetwork.ssr_external.gateway_address
}

output "external_subnet_id" {
  description = "The subnet id for the external subnet, used by other modules"
  value       = google_compute_subnetwork.ssr_external.id
}

output "external_subnet_name" {
  description = "The name of the external subnet, used by other modules"
  value       = google_compute_subnetwork.ssr_external.name
}

output "internal_subnet_gateway" {
  description = "The IP address assigned by GCP for the gateway of the internal subnet"
  value       = google_compute_subnetwork.ssr_internal.gateway_address
}

output "internal_subnet_id" {
  description = "The subnet id for the internal subnet, used by other modules"
  value       = google_compute_subnetwork.ssr_internal.id
}

output "internal_subnet_name" {
  description = "The name of the internal subnet, used by other modules"
  value       = google_compute_subnetwork.ssr_internal.name
}