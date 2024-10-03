variable "byol_image_link" {
  type    = string
  default = "projects/tsena-297623/global/images/ssr-byol-20240930-1350-v0"
}

variable "external_net_name" {
  description = "The name to assign the external SSR network in GCP"
  type        = string
  default     = "ssr-ext"
}

variable "gcp_advertised_range" {
  description = "The address range advertised by the GCP routers"
  type        = string
}

variable "internal_net_name" {
  description = "The name to assign the external SSR network in GCP"
  type        = string
  default     = "ssr-int"
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

variable "region1" {
  description = "The primary GCP region in which to deploy the resources"
  type        = string
}

variable "region1_external_subnet_range" {
  description = "The CIDR block assigned to the external subnet in the primary region"
  type        = string
}

variable "region1_gcp_asn" {
  description = "The ASN for the primary region's GCP router to use for itself"
  type        = string
}

variable "region1_internal_subnet_range" {
  description = "The CIDR block assigned to the internal subnet in the primary region"
  type        = string
}

variable "region1_ssr_asn" {
  description = "The ASN assigned to the SSR in the primary region"
  type        = string
}

variable "region1_ssr_name" {
  description = "The name of the primary region SSR as indicated when connecting to the Mist cloud"
  type        = string
}

variable "region1_ssr_zone" {
  description = "The GCP availability zone in which to deploy the primary region's SSR, must be within the previously defined region"
  type        = string
}

variable "region2" {
  description = "The secondary GCP region in which to deploy the resources"
  type        = string
}

variable "region2_external_subnet_range" {
  description = "The CIDR block assigned to the external subnet in the secondary region"
  type        = string
}

variable "region2_gcp_asn" {
  description = "The ASN for the secondary region's GCP router to use for itself"
  type        = string
}

variable "region2_internal_subnet_range" {
  description = "The CIDR block assigned to the internal subnet in the secondary region"
  type        = string
}

variable "region2_ssr_asn" {
  description = "The ASN assigned to the SSR in the secondary region"
  type        = string
}

variable "region2_ssr_name" {
  description = "The name of the secondary region SSR as indicated when connecting to the Mist cloud"
  type        = string
}

variable "region2_ssr_zone" {
  description = "The GCP availability zone in which to deploy the secondary region's SSR, must be within the previously defined region"
  type        = string
}

variable "ssr_version" {
  description = "The SSR version to install during BYOL onboarding in X.Y.Z format"
  type        = string
  default     = "6.2.5"
}

variable "ssr_machine_type" {
  type    = string
  default = "e2-standard-4"
}