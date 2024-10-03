variable "byol_image_link" {
  description = "The GCP selfLink for the SSR BYOL image resource to use for the SSR"
  type        = string
}

variable "external_net_name" {
  description = "The name used for the previously configured SSR external network"
  type        = string
}

variable "external_subnet_id" {
  description = "The id used for the previously configured SSR external subnetwork"
  type        = string
}

variable "external_subnet_name" {
  description = "The name used for the previously configured SSR external subnetwork"
  type        = string
}

variable "internal_net_name" {
  description = "The name used for the previously configured SSR internal network"
  type        = string
}

variable "internal_subnet_id" {
  description = "The id used for the previously configured SSR external subnetwork"
  type        = string
}

variable "internal_subnet_name" {
  description = "The name used for the previously configured SSR internal subnetwork"
  type        = string
}

variable "machine_type" {
  description = "The GCP machine_type to use when building the SSR VM"
  type        = string
}

variable "region" {
  description = "The GCP region in which to deploy the SSR"
  type        = string
}

variable "reg_code" {
  description = "The mist registration code to use when authenticating to the Mist cloud"
  type        = string
}

variable "ssr_name" {
  description = "The name of the SSR indicated when connecting to the Mist cloud"
  type        = string
}

variable "ssr_version" {
  description = "The SSR version to install during BYOL onboarding in X.Y.Z format"
  type        = string
}

variable "zone" {
  description = "The GCP availability zone in which to deploy the SSR"
  type        = string
}