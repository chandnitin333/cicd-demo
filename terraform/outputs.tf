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
  # dev sits behind the host's Apache TLS reverse proxy on the public domain,
  # not var.ssh_host directly (which environments/dev/terraform.tfvars points
  # at the server's raw IP for the SSH connection itself).
  value = var.environment == "dev" ? "https://demo.icadquesto.ai/" : "http://${var.ssh_host}:${var.host_port}"
}
