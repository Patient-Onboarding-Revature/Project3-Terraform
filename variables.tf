variable "project_id" {
    type = string
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
}

variable "jenkins_startup_script" {
    type = string
    default = "JenkinsShell.sh"
}

variable "database_name" {
    type = string
    default = "temp-db"
}

variable "authorized_networks_to_database" {
    type = list(object({
        name = string,
        value = string
    }))
    default = [
        {
            name = "all",
            value = "0.0.0.0/0" 
        }
    ]
}