// Project information
project_id = "p3-patient-onboarding"
region = "us-central1"
zone = "us-central1-a"

// Jenkins start up script name (in the resources directory)
jenkins_startup_script = "JenkinsShell.sh"

// Database properties (can't be the same name as one previously deleted within a week)
database_name = "project3-database"
database_instance_name = "postgres"
database_version = "POSTGRES_9_6"
database_tier = "db-f1-micro"
authorized_networks_to_database = [{name = "all", value = "0.0.0.0/0"}]

// Bucket name (must be globally unique)
bucket_webpage_name = "patient-onboarding-test"
bucket_data_sink = "p3-logging-bucket"

// KMS
keyring_name = "my-keyring"
key_name = "encryption-key"

// Firewall rules
allowed_into_bastion = ["0.0.0.0/0"]
allowed_into_jenkins = ["0.0.0.0/0"]

// Jenkins image
jenkins_image = "bbjitr-image-1"