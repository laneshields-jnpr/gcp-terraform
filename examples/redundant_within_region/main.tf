terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.3.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

module "networks" {
  source            = "../../modules/networks"
  external_net_name = var.external_net_name
  internal_net_name = var.internal_net_name
}

module "subnets" {
  source                = "../../modules/subnets"
  region                = var.region
  external_subnet_name  = "${var.external_net_name}-${var.region}"
  external_subnet_range = var.external_subnet_range
  external_network_id   = module.networks.external_net_id
  internal_subnet_name  = "${var.internal_net_name}-${var.region}"
  internal_subnet_range = var.internal_subnet_range
  internal_network_id   = module.networks.internal_net_id
  depends_on            = [module.networks]
}

module "ssr1" {
  source               = "../../modules/ssr_instance"
  region               = var.region
  zone                 = var.ssr1_zone
  external_net_name    = var.external_net_name
  external_subnet_id   = module.subnets.external_subnet_id
  external_subnet_name = module.subnets.external_subnet_name
  internal_net_name    = var.internal_net_name
  internal_subnet_id   = module.subnets.internal_subnet_id
  internal_subnet_name = module.subnets.internal_subnet_name
  byol_image_link      = var.byol_image_link
  reg_code             = var.reg_code
  ssr_version          = var.ssr_version
  ssr_name             = var.ssr1_name
  machine_type         = var.ssr_machine_type
  depends_on           = [module.subnets]
}

module "ssr2" {
  source               = "../../modules/ssr_instance"
  region               = var.region
  zone                 = var.ssr2_zone
  external_net_name    = var.external_net_name
  external_subnet_id   = module.subnets.external_subnet_id
  external_subnet_name = module.subnets.external_subnet_name
  internal_net_name    = var.internal_net_name
  internal_subnet_id   = module.subnets.internal_subnet_id
  internal_subnet_name = module.subnets.internal_subnet_name
  byol_image_link      = var.byol_image_link
  reg_code             = var.reg_code
  ssr_version          = var.ssr_version
  ssr_name             = var.ssr2_name
  machine_type         = var.ssr_machine_type
  depends_on           = [module.subnets]
}

module "gcp_router" {
  source               = "../../modules/gcp_router"
  region               = var.region
  router_name          = "${var.internal_net_name}-${var.region}-router"
  network_name         = var.internal_net_name
  subnetwork_id        = module.subnets.internal_subnet_id
  gcp_asn              = var.gcp_asn
  gcp_advertised_range = var.gcp_advertised_range
  depends_on           = [module.subnets]
}

module "ncc_spoke" {
  source                        = "../../modules/ncc_spoke_with_dual_ssr"
  spoke_name                    = "ssr-${var.region}-spoke"
  ssr1_name                     = var.ssr1_name
  ssr2_name                     = var.ssr2_name
  region                        = var.region
  project_id                    = var.project_id
  ncc_hub_name                  = var.ncc_hub_name
  ssr1_asn                      = var.ssr1_asn
  ssr2_asn                      = var.ssr2_asn
  gcp_router_name               = module.gcp_router.router_name
  gcp_router_int1_name          = module.gcp_router.router_int1_name
  gcp_router_int2_name          = module.gcp_router.router_int2_name
  ssr1_internal_private_address = module.ssr1.ssr_internal_private_address
  ssr1_self_link                = module.ssr1.ssr_self_link
  ssr2_internal_private_address = module.ssr2.ssr_internal_private_address
  ssr2_self_link                = module.ssr2.ssr_self_link
  depends_on                    = [module.ssr1, module.ssr2, module.gcp_router]
}