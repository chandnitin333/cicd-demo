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

# --- single shared server: every environment deploys here as its own ---
# --- container, distinguished by name and host port.                 ---

variable "ssh_host" {
  description = "SSH host of the shared deploy server"
  type        = string
  default     = "demo.icadquesto.ai"
}

variable "ssh_user" {
  description = "SSH user on the deploy server"
  type        = string
  default     = ""
}

variable "ssh_port" {
  description = "SSH port on the deploy server"
  type        = number
  default     = 22
}

variable "ssh_private_key" {
  description = "Private key for SSH auth to the deploy server (pass via TF_VAR_ssh_private_key, never commit it)"
  type        = string
  default     = ""
  sensitive   = true
}

variable "host_port" {
  description = "Host port this environment's container is published on (must differ per environment)"
  type        = number
}
