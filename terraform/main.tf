# Placeholder deploy step — no cloud provider wired up yet.
# Swap this null_resource for a real resource once a target is chosen, e.g.:
#   - aws_ecs_service / aws_apprunner_service (AWS)
#   - azurerm_container_app (Azure)
#   - google_cloud_run_v2_service (GCP)
# and pass var.image_tag as the container image for that resource.
resource "null_resource" "deploy" {
  triggers = {
    environment = var.environment
    image_tag   = var.image_tag
  }

  provisioner "local-exec" {
    command = "echo Deploying ${var.app_name} image ${var.image_tag} to ${var.environment}"
  }
}
