terraform {
  required_version = ">= 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.64"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.5"
    }
  }
}
