output "site1_external_gateway" {
  value = module.subnets_region1.external_subnet_gateway
}

output "site1_external_prefix" {
  value = split("/", var.region1_external_subnet_range)[1]
}

output "site1_external_private_address" {
  value = module.ssr1.ssr_external_private_address
}

output "site1_external_public_address" {
  value = module.ssr1.ssr_external_public_address
}

output "site1_gcp_asn" {
  value = var.region1_gcp_asn
}

output "site1_gcp_neighbor1" {
  value = module.gcp_router1.router_int1_address
}

output "site1_gcp_neighbor2" {
  value = module.gcp_router1.router_int2_address
}

output "site1_internal_prefix" {
  value = split("/", var.region1_internal_subnet_range)[1]
}

output "site1_internal_private_address" {
  value = module.ssr1.ssr_internal_private_address
}

output "site1_ssr_asn" {
  value = var.region1_ssr_asn
}

output "site2_external_gateway" {
  value = module.subnets_region2.external_subnet_gateway
}

output "site2_external_prefix" {
  value = split("/", var.region2_external_subnet_range)[1]
}

output "site2_external_private_address" {
  value = module.ssr2.ssr_external_private_address
}

output "site2_external_public_address" {
  value = module.ssr2.ssr_external_public_address
}

output "site2_gcp_asn" {
  value = var.region1_gcp_asn
}

output "site2_gcp_neighbor1" {
  value = module.gcp_router2.router_int1_address
}

output "site2_gcp_neighbor2" {
  value = module.gcp_router2.router_int2_address
}

output "site2_internal_prefix" {
  value = split("/", var.region2_internal_subnet_range)[1]
}

output "site2_internal_private_address" {
  value = module.ssr2.ssr_internal_private_address
}

output "site2_ssr_asn" {
  value = var.region1_ssr_asn
}