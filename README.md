To start:
- First create a service account for Terraform and give it role of project owner
- Download service account key and set environment variable GOOGLE_CLOUD_KEYFILE_JSON to the downloaded JSON file
- In project, enable Cloud Resource Manager API (cloudresourcemanager.apis.com)
- Set variables in terraform.tfvars to desired values
- Run the run.sh script