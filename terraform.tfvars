// Project information
project_id = "temp-project-0"
region = "us-central1"
zone = "us-central1-a"

// Jenkins start up script name (in the resources directory)
jenkins_startup_script = "JenkinsShell.sh"

// Database properties (can't be the same name as one previously deleted within a week)
database_name = "thisismydatabasedonotsteal"
database_version = "POSTGRES_9_6"
database_tier = "db-f1-micro"
authorized_networks_to_database = [{name = "all", value = "0.0.0.0/0"}]

// Bucket name (must be globally unique)
bucket_webpage_name = "thisismystaticbucketdonotsteal"
bucket_data_sink = "thisisadatasinkbucketdonotsteal"

// KMS
keyring_name = "my-keyring"
key_name = "encryption-key"

// Firewall
allowed_into_bastion = ["0.0.0.0/0"]
allowed_into_jenkins = ["0.0.0.0/0"]