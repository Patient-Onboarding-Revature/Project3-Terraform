resource "google_project_iam_custom_role" "jenkins-role" {
    role_id = "jenkinsUAT"
    title = "Jenkins Role"
    description = "Custom role for Jenkins VM"
    permissions = [
          "storage.buckets.get",
          "storage.objects.get",
          "storage.objects.create",
          "storage.buckets.update",
          "container.clusters.getCredentials",
          "container.pods.delete",
          "container.deployments.create",
          "container.deployments.update"
    ]
}