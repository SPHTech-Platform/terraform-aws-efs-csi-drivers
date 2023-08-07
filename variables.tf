variable "cluster_name" {
  description = "Name of Kubernetes Cluster"
  type        = string
}

variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "aws-efs-csi-driver"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  type        = string
  default     = "aws-efs-csi-driver"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  type        = string
  default     = "https://kubernetes-sigs.github.io/aws-efs-csi-driver"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  type        = string
  default     = "2.4.3"
}

variable "chart_namespace" {
  description = "Namespace to install the chart into"
  type        = string
  default     = "kube-system"
}

variable "chart_timeout" {
  description = "Timeout to wait for the Chart to be deployed."
  type        = number
  default     = 300
}

variable "max_history" {
  description = "Max History for Helm"
  type        = number
  default     = 20
}

variable "create_namespace" {
  description = "Create the namespace if it does not exist"
  type        = bool
  default     = false
}

########################
# Chart Values
########################

variable "image_repository" {
  description = "Image repository on Dockerhub"
  type        = string
  default     = "amazon/aws-efs-csi-driver"
}

variable "image_tag" {
  description = "Image tag"
  type        = string
  default     = "v1.5.5"
}

variable "resources_driver" {
  description = "Driver Resources"
  type        = map(any)
  default = {
    requests = {
      cpu    = "200m"
      memory = "200Mi"
    }
    limits = {
      cpu    = "200m"
      memory = "200Mi"
    }
  }
}

variable "resources_registrar" {
  description = "Registrar Resources"
  type        = map(any)
  default = {
    requests = {
      cpu    = "100m"
      memory = "100Mi"
    }
    limits = {
      cpu    = "100m"
      memory = "100Mi"
    }
  }
}

variable "resources_liveness" {
  description = "LivenessProbe Resources"
  type        = map(any)
  default = {
    requests = {
      cpu    = "100m"
      memory = "100Mi"
    }
    limits = {
      cpu    = "100m"
      memory = "100Mi"
    }
  }
}

########################
# IAM Role
########################
variable "oidc_provider_arn" {
  description = "OIDC Provider ARN for IRSA"
  type        = string
}

variable "iam_role_name" {
  description = "Name of IAM role for efs csi"
  type        = string
  default     = ""
}

##############
#### IRSA ####
##############
variable "service_account_name" {
  description = "Name of service account to create. Not generated"
  type        = string
  default     = "efs-csi-controller-sa"
}

variable "create_default_irsa" {
  description = "Create default IRSA for service account"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Kubernetes namespace, where the service account want to create"
  type        = string
  default     = "kube-system"
}
