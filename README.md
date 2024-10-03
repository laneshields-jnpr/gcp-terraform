# Juniper Session Smart Router Mist GCP Terraform Examples

This repository contains sample code that can be used to deploy Mist-managed Juniper SSRs in GCP using a bring your own license (BYOL) image.

## About the structure of this repo

In an effort to provide maximum reusability of the terraform code, this project has been organized into various modules. The individual deployment models included under the [examples](./examples) folder make use of these modules.

## About Network Connectivity Center

These examples leverage Google Cloud's [Network Connectivity Center](https://cloud.google.com/network-connectivity-center) (NCC). NCC provides a transit architecture based on a hub and spoke model. GCP administrators can crete an NCC hub and attach multiple spokes. A spoke can be a GCP virtual network or a router appliance running as a VM instance within GCP. Routes can be exchanged with spokes through the hub providing a simplified method of connectivity between cloud workloads and on-premise devices through the SSR VM instances.

These examples assume that an NCC hub has already been created and that any workload VPCs that need connectivity to on-premises resources have been connected to this hub.

## About Terraform

[Terraform](https://developer.hashicorp.com/terraform) is an infrastructure as code tool that allows users to model cloud resources as code objects and will then interact with cloud APIs to orchestrate the lifecycle of these resources. These examples make use of the [Google Cloud Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs) for Terraform. These examples were written and validated using Terraform `v1.9.6`.
