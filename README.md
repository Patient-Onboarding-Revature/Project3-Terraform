To start:
- First create a service account for Terraform and give it role of project owner
- Download service account key and set environment variable GOOGLE_CLOUD_KEYFILE_JSON to the downloaded JSON file
- In project, manually enable Cloud Resource Manager API (cloudresourcemanager.googleapis.com) in the Google Console
- *May want to manually enable Kubernetes Cluster API (container.googleapis.com) else you may need to run "terraform apply" twice
- Set variables in terraform.tfvars to desired values
- Run the run.sh script