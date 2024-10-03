variable "byol_image_link" {
  type    = string
  default = "projects/tsena-297623/global/images/ssr-byol-20240930-1350-v0"
}

variable "external_net_name" {
  description = "The name to assign the external SSR network in GCP"
  type        = string
  default     = "ssr-ext"
}

variable "external_subnet_range" {
  description = "The CIDR block assigned to the external subnet"
  type        = string
}

variable "gcp_advertised_range" {
  description = "The address range advertised by the GCP router"
  type        = string
}

variable "gcp_asn" {
  description = "The ASN for the GCP router to use for itself"
  type        = string
}

variable "internal_net_name" {
  description = "The name to assign the internal SSR network in GCP"
  type        = string
  default     = "ssr-int"
}

variable "internal_subnet_range" {
  description = "The CIDR block assigned to the internal subnet"
  type        = string
}

variable "ncc_hub_name" {
  description = "The name of the previously built NCC hub to which this spoke will be attached"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID in which all resources will be deployed"
  type        = string
}

variable "reg_code" {
  description = "The mist registration code to use when authenticating to the Mist cloud"
  type        = string
}

variable "region" {
  description = "The GCP region in which to build all of the resources"
  type        = string
}

variable "ssr_machine_type" {
  type    = string
  default = "e2-standard-4"
}

variable "ssr_version" {
  description = "The SSR version to install during BYOL onboarding in X.Y.Z format"
  type        = string
  default     = "6.2.5"
}

variable "ssr1_asn" {
  description = "The ASN assigned to the primary SSR"
  type        = string
}

variable "ssr1_name" {
  description = "The name of the primary SSR as indicated when connecting to the Mist cloud"
  type        = string
}

variable "ssr1_zone" {
  description = "The GCP availability zone in which to deploy the primary SSR, must be within the previously defined region"
  type        = string
}

variable "ssr2_asn" {
  description = "The ASN assigned to the secondary SSR"
  type        = string
}

variable "ssr2_name" {
  description = "The name of the secondary SSR as indicated when connecting to the Mist cloud"
  type        = string
}

variable "ssr2_zone" {
  description = "The GCP availability zone in which to deploy the secondary SSR, must be within the previously defined region"
  type        = string
}