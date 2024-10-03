resource "google_compute_address" "router_int1" {
  name         = "${var.router_name}-int1-address"
  region       = var.region
  subnetwork   = var.subnetwork_id
  address_type = "INTERNAL"
}

resource "google_compute_address" "router_int2" {
  name         = "${var.router_name}-int2-address"
  region       = var.region
  subnetwork   = var.subnetwork_id
  address_type = "INTERNAL"
}

resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = var.network_name
  bgp {
    asn            = var.gcp_asn
    advertise_mode = "CUSTOM"
    advertised_ip_ranges {
      range = var.gcp_advertised_range
    }
  }
}

resource "google_compute_router_interface" "router_int1" {
  name               = "${var.router_name}-int1"
  router             = google_compute_router.router.name
  region             = var.region
  subnetwork         = var.subnetwork_id
  private_ip_address = google_compute_address.router_int1.address
}

resource "google_compute_router_interface" "router_int2" {
  name                = "${var.router_name}-int2"
  router              = google_compute_router.router.name
  region              = var.region
  subnetwork          = var.subnetwork_id
  redundant_interface = google_compute_router_interface.router_int1.name
  private_ip_address  = google_compute_address.router_int2.address
}