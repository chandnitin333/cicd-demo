output "environment" {
  description = "Environment that was deployed"
  value       = var.environment
}

output "deployed_image" {
  description = "Docker image tag that was deployed"
  value       = var.image_tag
}
