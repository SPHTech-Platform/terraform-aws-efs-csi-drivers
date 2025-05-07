locals {
  controller_service_account_annotations = var.create_default_irsa ? {
    "eks.amazonaws.com/role-arn" = module.efs_csi_role[0].iam_role_arn
  } : {}
  node_service_account_annotations = var.create_default_irsa ? {
    "eks.amazonaws.com/role-arn" = module.efs_csi_role[0].iam_role_arn
  } : {}

  values = {
    image_repository = var.image_repository
    image_tag        = var.image_tag

    liveness_probe_image_tag        = var.liveness_probe_image_tag
    node_driver_registrar_image_tag = var.node_driver_registrar_image_tag
    external_provisioner_image_tag  = var.external_provisioner_image_tag

    controller_service_account_name        = var.controller_service_account_name
    controller_resources                   = jsonencode(var.controller_resources)
    controller_service_account_annotations = jsonencode(local.controller_service_account_annotations)

    node_service_account_name        = var.node_service_account_name
    node_resources                   = jsonencode(var.node_resources)
    node_service_account_annotations = jsonencode(local.node_service_account_annotations)

    storage_classes = jsonencode(var.storage_classess)

    enable_helm_hooks_for_csi_driver = var.enable_helm_hooks_for_csi_driver
  }

}

resource "helm_release" "release" {
  name       = var.release_name
  chart      = var.chart_name
  repository = var.chart_repository
  version    = var.chart_version
  namespace  = var.chart_namespace

  max_history = var.max_history
  timeout     = var.chart_timeout

  create_namespace = var.create_namespace

  values = [
    templatefile("${path.module}/templates/values.yaml", local.values),
  ]
}
