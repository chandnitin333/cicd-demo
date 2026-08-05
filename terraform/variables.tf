variable "environment" {
  description = "Target deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "app_name" {
  description = "Name of the application being deployed"
  type        = string
  default     = "cicd-demo"
}

variable "image_tag" {
  description = "Docker image tag produced by the CI build stage (e.g. ghcr.io/org/app:dev-<sha>)"
  type        = string
}
