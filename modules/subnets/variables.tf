variable "external_network_id" {
  description = "The network id of the external SSR network"
  type        = string
}

variable "external_subnet_name" {
  description = "The name to assign to the external SSR subnet in GCP"
  type        = string
}

variable "external_subnet_range" {
  description = "The CIDR block assigned to the external subnet"
  type        = string
}

variable "internal_network_id" {
  description = "The network id of the internal SSR network"
  type        = string
}

variable "internal_subnet_name" {
  description = "The name to assign to the internal SSR subnet in GCP"
  type        = string
}

variable "internal_subnet_range" {
  description = "The CIDR block assigned to the internal subnet"
  type        = string
}

variable "region" {
  description = "The GCP region in which the subnets will be created"
  type        = string
}