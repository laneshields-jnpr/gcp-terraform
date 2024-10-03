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

module "subnets_region1" {
  source                = "../../modules/subnets"
  region                = var.region1
  external_subnet_name  = "${var.external_net_name}-${var.region1}"
  external_subnet_range = var.region1_external_subnet_range
  external_network_id   = module.networks.external_net_id
  internal_subnet_name  = "${var.internal_net_name}-${var.region1}"
  internal_subnet_range = var.region1_internal_subnet_range
  internal_network_id   = module.networks.internal_net_id
  depends_on            = [module.networks]
}

module "subnets_region2" {
  source                = "../../modules/subnets"
  region                = var.region2
  external_subnet_name  = "${var.external_net_name}-${var.region2}"
  external_subnet_range = var.region2_external_subnet_range
  external_network_id   = module.networks.external_net_id
  internal_subnet_name  = "${var.internal_net_name}-${var.region2}"
  internal_subnet_range = var.region2_internal_subnet_range
  internal_network_id   = module.networks.internal_net_id
  depends_on            = [module.networks]
}

module "ssr1" {
  source               = "../../modules/ssr_instance"
  region               = var.region1
  zone                 = var.region1_ssr_zone
  external_net_name    = var.external_net_name
  external_subnet_id   = module.subnets_region1.external_subnet_id
  external_subnet_name = module.subnets_region1.external_subnet_name
  internal_net_name    = var.internal_net_name
  internal_subnet_id   = module.subnets_region1.internal_subnet_id
  internal_subnet_name = module.subnets_region1.internal_subnet_name
  byol_image_link      = var.byol_image_link
  reg_code             = var.reg_code
  ssr_version          = var.ssr_version
  ssr_name             = var.region1_ssr_name
  machine_type         = var.ssr_machine_type
  depends_on           = [module.subnets_region1]
}

module "ssr2" {
  source               = "../../modules/ssr_instance"
  region               = var.region2
  zone                 = var.region2_ssr_zone
  external_net_name    = var.external_net_name
  external_subnet_id   = module.subnets_region2.external_subnet_id
  external_subnet_name = module.subnets_region2.external_subnet_name
  internal_net_name    = var.internal_net_name
  internal_subnet_id   = module.subnets_region2.internal_subnet_id
  internal_subnet_name = module.subnets_region2.internal_subnet_name
  byol_image_link      = var.byol_image_link
  reg_code             = var.reg_code
  ssr_version          = var.ssr_version
  ssr_name             = var.region2_ssr_name
  machine_type         = var.ssr_machine_type
  depends_on           = [module.subnets_region2]
}

module "gcp_router1" {
  source               = "../../modules/gcp_router"
  region               = var.region1
  router_name          = "${var.internal_net_name}-${var.region1}-router"
  network_name         = var.internal_net_name
  subnetwork_id        = module.subnets_region1.internal_subnet_id
  gcp_asn              = var.region1_gcp_asn
  gcp_advertised_range = var.gcp_advertised_range
  depends_on           = [module.subnets_region1]
}

module "gcp_router2" {
  source               = "../../modules/gcp_router"
  region               = var.region2
  router_name          = "${var.internal_net_name}-${var.region2}-router"
  network_name         = var.internal_net_name
  subnetwork_id        = module.subnets_region2.internal_subnet_id
  gcp_asn              = var.region2_gcp_asn
  gcp_advertised_range = var.gcp_advertised_range
  depends_on           = [module.subnets_region2]
}

module "region1_ncc_spoke" {
  source                       = "../../modules/ncc_spoke_with_single_ssr"
  spoke_name                   = "ssr-${var.region1}-spoke"
  ssr_name                     = var.region1_ssr_name
  region                       = var.region1
  project_id                   = var.project_id
  ncc_hub_name                 = var.ncc_hub_name
  ssr_asn                      = var.region1_ssr_asn
  gcp_router_name              = module.gcp_router1.router_name
  gcp_router_int1_name         = module.gcp_router1.router_int1_name
  gcp_router_int2_name         = module.gcp_router1.router_int2_name
  ssr_internal_private_address = module.ssr1.ssr_internal_private_address
  ssr_self_link                = module.ssr1.ssr_self_link
  depends_on                   = [module.ssr1, module.gcp_router1]
}

module "region2_ncc_spoke" {
  source                       = "../../modules/ncc_spoke_with_single_ssr"
  spoke_name                   = "ssr-${var.region2}-spoke"
  ssr_name                     = var.region2_ssr_name
  region                       = var.region2
  project_id                   = var.project_id
  ncc_hub_name                 = var.ncc_hub_name
  ssr_asn                      = var.region2_ssr_asn
  gcp_router_name              = module.gcp_router2.router_name
  gcp_router_int1_name         = module.gcp_router2.router_int1_name
  gcp_router_int2_name         = module.gcp_router2.router_int2_name
  ssr_internal_private_address = module.ssr2.ssr_internal_private_address
  ssr_self_link                = module.ssr2.ssr_self_link
  depends_on                   = [module.ssr2, module.gcp_router2]
}