variable "cluster_name" {
  description = "Name of Kubernetes Cluster"
  type        = string
}

variable "region" {
  description = "The AWS region for the kubernetes cluster. Set to use KIAM or kube2iam for example."
  type        = string
  default     = ""
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

variable "iam_role_description" {
  description = "Description for IAM role for efs csi"
  type        = string
  default     = "Used by EFS CSI Drivers for EKS"
}

variable "iam_role_path" {
  description = "IAM Role path for efs csi"
  type        = string
  default     = ""
}

variable "iam_role_permission_boundary" {
  description = "Permission boundary ARN for IAM Role for efs csi"
  type        = string
  default     = ""
}

variable "iam_role_tags" {
  description = "Tags for IAM Role for efs csi"
  type        = map(string)
  default     = {}
}

variable "iam_role_policy" {
  description = "Override the IAM policy for the efs csi"
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
