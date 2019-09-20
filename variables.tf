variable "jenkins_startup_script" {
    type = string
    default = "JenkinsShell.sh"
}

variable "project" {
    type = string
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
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