# Geo-Redundant SSR

This example deploys two SSRs in different GCP regions. They will be connected as spokes to a Network Connectivity Center hub to provide access to GCP workloads. Using the provided hub profile templates, these routers will be deployed as redundant in an active-standby manner.

## Architecture

The terraform provided in this example will deploy the following resources in GCP:

![Topology](./geo-redundant%20architecture.png)

Note: The Network Connectivity Center Hub is not created by this Terraform. That should be created separately as should spoke connections to this hub for any workload VPCs. The terraform will create connections for new spokes to this existing hub for the SSRs.

## Required Variables

These variables must be set in your terraform.tfvars file in order fo the deployment to succeed:
- *gcp_advertised_range* - The CIDR range to advertise from the GCP router towards the SSR
- *gcp_asn* - The ASN assigned to the GCP router to which the SSR will BGP peer
- *ncc_hub_name* - The name of the pre-deployed NCC hub to which to attach the SSR as a spoke
- *project_id* - The project within GCP to use for the deployment
- *reg_code* - The registration code for the Mist org to which the SSR will register
- *region1* - The [GCP region](https://cloud.google.com/compute/docs/regions-zones) into which to deploy the primary SSR
- *region1_external_subnet_range* - The CIDR block to assign to the region1 external subnet deployed in GCP
- *region1_internal_subnet_range* - The CIDR block to assign to the region1 internal subnet deployed in GCP
- *region1_ssr_asn* - The ASN assigned to the primary SSR, used for the BGP peering with the cloud
- *region1_ssr_name* - The name of the primary SSR used both for the instance name in GCP and how the router will be identified when registering with the Mist cloud
- *region1_ssr_zone* - The [Zone](https://cloud.google.com/compute/docs/regions-zones) within region1 to which to deploy the primary SSR VM. Specify the full zone name, not merely the letter
- *region2* - The [GCP region](https://cloud.google.com/compute/docs/regions-zones) into which to deploy the secondary SSR
- *region2_external_subnet_range* - The CIDR block to assign to the region2 external subnet deployed in GCP
- *region2_internal_subnet_range* - The CIDR block to assign to the region2 internal subnet deployed in GCP
- *region2_ssr_asn* - The ASN assigned to the secondary SSR, used for the BGP peering with the cloud
- *region2_ssr_name* - The name of the secondary SSR used both for the instance name in GCP and how the router will be identified when registering with the Mist cloud
- *region2_ssr_zone* - The [Zone](https://cloud.google.com/compute/docs/regions-zones) within region2 to which to deploy the secondary SSR VM. Specify the full zone name, not merely the letter

## Optional Variables

These variables include default values that may be modified if needed:
- *byol_image_link* - The resource link to the Juniper provided BYOL image. This should only be changed when advised by Juniper.
- *external_net_name* - The name used for the external VPC network and subnet names. This can be changed if the default value of `ssr-ext` is not desired
- *internal_net_name* - The name used for the internal VPC network and subnet names. This can be changed if the default value of `ssr-int` is not desired
- *ssr_machine_type* - This should be changed based on the resources required for the router based on the sizing of the deployment. Contact Juniper personnel for assistance with this setting. The default setting is sufficient for a minimal deployment for evaluation.
- *ssr_version* - The version of SSR software to load on the device during onboarding. The default value is `6.2.5`.

## Outputs

After the deployment, Terraform will return output variables. These outputs can used as variables in the sites to which the router is assigned in order to deploy using the provided template. There should be one site created for each router. The variables beginning with `site1_` should be added to the site associated with the primary SSR (removing that prefix) and similarly the variables beginning with `site2_` should be added to the site associated with the secondary SSR (again, removing the prefix).

## Templates

There are two included template files: `gcp_hub1.json` and `gcp_hub2.json`. These can be imported as hub profiles and applied to the router adopted to each site. With the correct variables assigned to the site, each SSR will come up and create BGP neighbor relationships with the GCP router. The templates will use AS-path prepending to ensure one router is preferred over another in order to ensure route symmetry.

The templates assumes that the network assigned to the LAN of the router is named `gcp`. If this is not true in your deployment, the templates will need to be modified. The templates also does not include any application policies, these will need to be added in order to allow traffic to pass.