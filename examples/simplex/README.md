# Simplex SSR deployed in GCP

This example deploys a single SSR in GCP. The SSR will be connected as a spoke to a Network Connectivity Center hub to provide access to GCP workloads.

## Architecture

The terraform provided in this example will deploy the following resources in GCP:

![Topology](./simplex%20architecture.png)

Note: The Network Connectivity Center Hub is not created by this Terraform. That should be created separately as should spoke connections to this hub for any workload VPCs. The terraform will create a connection to a new spoke to this existing hub for the SSR.

## Required Variables

These variables must be set in your terraform.tfvars file in order fo the deployment to succeed:
- *external_subnet_range* - The CIDR block to assign to the external subnet deployed in GCP
- *gcp_advertised_range* - The CIDR range to advertise from the GCP router towards the SSR
- *gcp_asn* - The ASN assigned to the GCP router to which the SSR will BGP peer
- *internal_subnet_range* - The CIDR block to assign to the internal subnet deployed in GCP
- *ncc_hub_name* - The name of the pre-deployed NCC hub to which to attach the SSR as a spoke
- *project_id* - The project within GCP to use for the deployment
- *reg_code* - The registration code for the Mist org to which the SSR will register
- *region* - The [GCP region](https://cloud.google.com/compute/docs/regions-zones) into which to deploy the resources
- *ssr_asn* - The ASN assigned to the SSR used for the BGP peering with the cloud
- *ssr_name* - The name of the SSR used both for the instance name in GCP and how the router will be identified when registering with the Mist cloud
- *zone* - The [Zone](https://cloud.google.com/compute/docs/regions-zones) within the region to which to deploy the VM. Specify the full zone name, not merely the letter

## Optional Variables

These variables include default values that may be modified if needed:
- *byol_image_link* - The resource link to the Juniper provided BYOL image. This should only be changed when advised by Juniper.
- *external_net_name* - The name used for the external VPC network and subnet names. This can be changed if the default value of `ssr-ext` is not desired
- *internal_net_name* - The name used for the internal VPC network and subnet names. This can be changed if the default value of `ssr-int` is not desired
- *ssr_machine_type* - This should be changed based on the resources required for the router based on the sizing of the deployment. Contact Juniper personnel for assistance with this setting. The default setting is sufficient for a minimal deployment for evaluation.
- *ssr_version* - The version of SSR software to load on the device during onboarding. The default value is `6.2.5`.

## Outputs

After the deployment, Terraform will return output variables. These outputs can used as variables in the site to which the router is assigned in order to deploy using the provided template.

## Template

The included template file `gcp.json` can be imported as a hub profiles and applied to the router adopted to the site. With the correct variables assigned to the site, the SSR will come up and create BGP neighbor relationships with the GCP router. The template will use AS-path prepending to ensure one path is preferred in order to ensure route symmetry.

The template assumes that the network assigned to the LAN of this router is named `gcp`. If this is not true in your deployment, the template will need to be modified. The template also does not include any application policies, these will need to be added in order to allow traffic to pass.