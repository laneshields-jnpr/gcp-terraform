# Example Deployments

This project includes several example deployment architectures for deploying SSR in GCP and connecting to a Google Network Connectivity Hub. These examples may be used directly to deploy following the instructions below. Each example has slight variations that will be covered in the example-specific documentation. The available options are:

* [Simplex](./simplex/README.md) - A single SSR providing connectivity to resources in GCP
* [Redundant within region](./redundant_within_region/README.md) - Two SSRs deployed in a redundant matter within a single region
* [Geo-Redundant](./geo_redundant/README.md) - Two SSRs deployed in a redundant manner in two different GCP regions

## Steps to Deploy

### Install and setup gcloud CLI

Perform these steps on the device that will be running Terraform. This will provide the authentication needed for Terraform to interact with GCP
1. Follow the directions to [install gcloud shell](https://cloud.google.com/sdk/docs/install)
2. Initialize the gcloud CLI by running `gcloud init` and authenticating as your GCP user. Additional documentation is found [here](https://cloud.google.com/sdk/docs/initializing)

### Install Terraform

You will need to install Terraform in order to run any of these examples. Installation instructions can be found [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Clone this project and prepare your specific options

This project will need to be cloned onto the device that will run Terraform: `git clone <URL>`

Enter the folder of the specific example you would like to build: `cd gcp-terraform/examples/<example folder>`

### Assign required variables

In the example folder, create a file named `terraform.tfvars`. This file will need to define certain variables in order to deploy the resources into GCP. Each example provides a list of the required and optional variables that need to be defined in this file.

This file should be formatted similar to the example below.

```
project_id            = "gcp-projectname"
ncc_hub_name          = "ncc-hub"
region                = "us-east1"
zone                  = "us-east1-b"
reg_code              = "<redacted>"
ssr_name              = "gcp-byol1"
gcp_asn               = "65101"
ssr_asn               = "65000"
external_subnet_range = "10.0.0.0/29"
internal_subnet_range = "10.0.0.8/29"
gcp_advertised_range  = "10.0.0.0/8"
```

### Deploy via terraform

Run these commands to initialize terraform (downloading the GCP module) and deploy the resources to your cloud environment:

```bash
terraform init
terraform deploy
```

After Terraform has successfully completed, certain values will be reported back to the user, such as IP addresses selected for interfaces. These can be assigned to site variables in Mist for use with sample hub profiles included in each example. Please refer to the documentation for each example for details on the specific variables and templates. The value of these variables can also be retrieved subsequently by running `terraform output` from the working directory.

### Destroy the deployed resources

If you should desire to undeploy all resources, Terraform can be used to remove all the resources previously deployed by running `terraform destroy` in the working directory.