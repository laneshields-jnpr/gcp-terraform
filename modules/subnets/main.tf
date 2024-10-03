resource "google_compute_subnetwork" "ssr_external" {
  name          = var.external_subnet_name
  ip_cidr_range = var.external_subnet_range
  region        = var.region
  network       = var.external_network_id
}

resource "google_compute_subnetwork" "ssr_internal" {
  name          = var.internal_subnet_name
  ip_cidr_range = var.internal_subnet_range
  region        = var.region
  network       = var.internal_network_id
}