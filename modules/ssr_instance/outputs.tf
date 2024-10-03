output "ssr_external_private_address" {
  description = "The private address assigned by GCP for the SSR's external interface"
  value       = google_compute_address.ssr_external_private.address
}

output "ssr_external_public_address" {
  description = "The public IP address assigned by GCP for the SSR's external interface"
  value       = google_compute_address.ssr_external_public.address
}

output "ssr_internal_private_address" {
  description = "The private address assigned by GCP for the SSR's internal interface"
  value       = google_compute_address.ssr_internal_private.address
}

output "ssr_self_link" {
  description = "The GCP selfLink for the SSR VM resource, used by other modules"
  value       = google_compute_instance.ssr.self_link
}