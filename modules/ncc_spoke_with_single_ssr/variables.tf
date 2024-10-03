variable "gcp_router_int1_name" {
  description = "The name of the primary interface of the GCP router"
  type        = string
}

variable "gcp_router_int2_name" {
  description = "The name of the secondary interface of the GCP router"
  type        = string
}

variable "gcp_router_name" {
  description = "The name of the GCP router in this spoke"
  type        = string
}

variable "ncc_hub_name" {
  description = "The name of the previously built NCC hub to which this spoke will be attached"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID associated with the previously built NCC hub"
  type        = string
}

variable "region" {
  description = "The GCP region in which to build this NCC spoke"
  type        = string
}

variable "spoke_name" {
  description = "The name of the NCC spoke as it will appear in GCP"
  type        = string
}

variable "ssr_asn" {
  description = "The ASN assigned to the SSR"
  type        = string
}

variable "ssr_internal_private_address" {
  description = "The private IP address of the SSR's interface on the internal network"
  type        = string
}

variable "ssr_name" {
  description = "The name of the SSR"
  type        = string
}

variable "ssr_self_link" {
  description = "The GCP selfLink of the VM instance for the SSR"
  type        = string
}