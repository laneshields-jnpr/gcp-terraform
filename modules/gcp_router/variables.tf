variable "gcp_advertised_range" {
  description = "The address range advertised by this GCP router"
  type        = string
}

variable "gcp_asn" {
  description = "The ASN for the GCP router to use for itself"
  type        = string
}

variable "network_name" {
  description = "The name of the previously built network in which to create the GCP router's interfaces"
  type        = string
}

variable "region" {
  description = "The GCP region in which to deploy this GCP router"
  type        = string
}

variable "router_name" {
  description = "The name of this GCP router resource"
  type        = string
}

variable "subnetwork_id" {
  description = "The id of the previously built subnetwork in which to create the GCP router's interfaces"
  type        = string
}