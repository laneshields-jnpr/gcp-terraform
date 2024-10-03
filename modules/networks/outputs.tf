output "external_net_id" {
  description = "The network id of the external SSR network used by other modules"
  value       = google_compute_network.ssr_external.id
}

output "internal_net_id" {
  description = "The network id of the internal SSR network used by other modules"
  value       = google_compute_network.ssr_internal.id
}