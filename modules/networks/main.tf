resource "google_compute_network" "ssr_external" {
  name                    = var.external_net_name
  auto_create_subnetworks = false
}

resource "google_compute_network" "ssr_internal" {
  name                    = var.internal_net_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_firewall" "external" {
  name    = "${var.external_net_name}-fw"
  network = var.external_net_name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on    = [google_compute_network.ssr_external]
}

resource "google_compute_firewall" "internal" {
  name    = "${var.internal_net_name}-fw"
  network = var.internal_net_name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on    = [google_compute_network.ssr_internal]
}