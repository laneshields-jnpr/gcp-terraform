resource "google_compute_address" "ssr_external_public" {
  name   = "${var.ssr_name}-external-public"
  region = var.region
}

resource "google_compute_address" "ssr_external_private" {
  name         = "${var.ssr_name}-external-private"
  region       = var.region
  subnetwork   = var.external_subnet_id
  address_type = "INTERNAL"
}

resource "google_compute_address" "ssr_internal_private" {
  name         = "${var.ssr_name}-internal-private"
  region       = var.region
  subnetwork   = var.internal_subnet_id
  address_type = "INTERNAL"
}

resource "google_compute_instance" "ssr" {
  name         = var.ssr_name
  machine_type = var.machine_type
  zone         = var.zone

  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = var.byol_image_link
    }
  }

  network_interface {
    network    = var.external_net_name
    subnetwork = var.external_subnet_name
    network_ip = google_compute_address.ssr_external_private.address
    access_config {
      nat_ip = google_compute_address.ssr_external_public.address
    }
  }

  network_interface {
    network    = var.internal_net_name
    subnetwork = var.internal_subnet_name
    network_ip = google_compute_address.ssr_internal_private.address
  }

  metadata = {
    user-data = templatefile("${path.module}/user_data.template",
      {
        reg_code    = var.reg_code
        ssr_version = var.ssr_version
        router_name = var.ssr_name
      }
    )
  }
}