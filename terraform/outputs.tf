output "environment" {
  description = "Environment that was deployed"
  value       = var.environment
}

output "deployed_image" {
  description = "Docker image tag that was deployed"
  value       = var.image_tag
}

output "url" {
  description = "URL this environment is reachable at"
  value       = "http://${var.ssh_host}:${var.host_port}"
}
