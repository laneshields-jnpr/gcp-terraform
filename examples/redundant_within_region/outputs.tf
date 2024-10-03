output "site1_external_gateway" {
  value = module.subnets.external_subnet_gateway
}

output "site1_external_prefix" {
  value = split("/", var.external_subnet_range)[1]
}

output "site1_external_private_address" {
  value = module.ssr1.ssr_external_private_address
}

output "site1_external_public_address" {
  value = module.ssr1.ssr_external_public_address
}

output "site1_gcp_asn" {
  value = var.gcp_asn
}

output "site1_gcp_neighbor" {
  value = module.gcp_router.router_int1_address
}

output "site1_internal_private_address" {
  value = module.ssr1.ssr_internal_private_address
}

output "site1_internal_prefix" {
  value = split("/", var.internal_subnet_range)[1]
}

output "site1_ssr_asn" {
  value = var.ssr1_asn
}

output "site2_external_gateway" {
  value = module.subnets.external_subnet_gateway
}

output "site2_external_prefix" {
  value = split("/", var.external_subnet_range)[1]
}

output "site2_external_private_address" {
  value = module.ssr2.ssr_external_private_address
}

output "site2_external_public_address" {
  value = module.ssr2.ssr_external_public_address
}

output "site2_gcp_asn" {
  value = var.gcp_asn
}

output "site2_gcp_neighbor" {
  value = module.gcp_router.router_int2_address
}

output "site2_internal_prefix" {
  value = split("/", var.internal_subnet_range)[1]
}

output "site2_internal_private_address" {
  value = module.ssr2.ssr_internal_private_address
}

output "site2_ssr_asn" {
  value = var.ssr1_asn
}