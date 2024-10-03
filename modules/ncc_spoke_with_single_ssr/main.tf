resource "google_network_connectivity_spoke" "primary" {
  name     = var.spoke_name
  location = var.region
  hub      = "projects/${var.project_id}/locations/global/hubs/${var.ncc_hub_name}"
  linked_router_appliance_instances {
    instances {
      virtual_machine = var.ssr_self_link
      ip_address      = var.ssr_internal_private_address
    }

    site_to_site_data_transfer = true
  }
}

resource "google_compute_router_peer" "ssr1_int1" {
  name                      = "${var.ssr_name}-peer1"
  router                    = var.gcp_router_name
  region                    = var.region
  peer_asn                  = var.ssr_asn
  advertised_route_priority = 100
  interface                 = var.gcp_router_int1_name
  router_appliance_instance = var.ssr_self_link
  advertise_mode            = "CUSTOM"

  bfd {
    session_initialization_mode = "PASSIVE"
  }

  depends_on = [google_network_connectivity_spoke.primary]
}

resource "google_compute_router_peer" "ssr1_int2" {
  name                      = "${var.ssr_name}-peer2"
  router                    = var.gcp_router_name
  region                    = var.region
  peer_asn                  = var.ssr_asn
  advertised_route_priority = 100
  interface                 = var.gcp_router_int2_name
  router_appliance_instance = var.ssr_self_link
  advertise_mode            = "CUSTOM"

  bfd {
    session_initialization_mode = "PASSIVE"
  }

  depends_on = [google_network_connectivity_spoke.primary]
}