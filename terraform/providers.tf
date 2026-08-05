terraform {
  required_version = ">= 1.5.0"

  # Local backend for now — swap for a remote backend (S3, azurerm, gcs)
  # once a cloud target is chosen, and add one state key per environment
  # (this repo already selects a Terraform workspace per environment).
  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

provider "null" {}
