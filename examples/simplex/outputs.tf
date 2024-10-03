output "external_public_address" {
  value = module.ssr.ssr_external_public_address
}

output "external_private_address" {
  value = module.ssr.ssr_external_private_address
}

output "internal_private_address" {
  value = module.ssr.ssr_internal_private_address
}

output "external_gateway" {
  value = module.subnets.external_subnet_gateway
}

output "external_prefix" {
  value = split("/", var.external_subnet_range)[1]
}

output "internal_prefix" {
  value = split("/", var.internal_subnet_range)[1]
}

output "ssr_asn" {
  value = var.ssr_asn
}

output "gcp_asn" {
  value = var.gcp_asn
}

output "gcp_neighbor1" {
  value = module.gcp_router.router_int1_address
}

output "gcp_neighbor2" {
  value = module.gcp_router.router_int2_address
}