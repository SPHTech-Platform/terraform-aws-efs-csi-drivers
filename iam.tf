module "efs_csi_role" {
  count = var.create_default_irsa ? 1 : 0

  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.55"

  role_name_prefix = coalesce(var.iam_role_name, "${var.cluster_name}-efs-csi-")
  role_description = "EKS Cluster ${var.cluster_name} EFS CSI Driver role"

  attach_efs_csi_policy = true
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["${var.namespace}:${local.service_account_name}"]
    }
  }
}
