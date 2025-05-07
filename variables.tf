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
  default     = "3.1.9"
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
  default     = "public.ecr.aws/efs-csi-driver/amazon/aws-efs-csi-driver"
}

variable "image_tag" {
  description = "Image tag"
  type        = string
  default     = "v2.1.8"
}

variable "liveness_probe_image_tag" {
  description = "Liveness Probe Image Tag"
  type        = string
  default     = "v2.14.0-eks-1-32-6"
}

variable "node_driver_registrar_image_tag" {
  description = "Node Driver Registrar Image Tag"
  type        = string
  default     = "v2.13.0-eks-1-32-6"
}

variable "external_provisioner_image_tag" {
  description = "External Provisioner Image Tag"
  type        = string
  default     = "v5.2.0-eks-1-32-6"
}

variable "controller_resources" {
  description = "Controller Resources"
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

variable "node_resources" {
  description = "Node Resources"
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

variable "storage_classess" {
  description = "Storage Classes"
  type        = any
  default     = []
}

variable "enable_helm_hooks_for_csi_driver" {
  description = "Enable Helm hooks for CSI driver"
  type        = bool
  default     = true
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
