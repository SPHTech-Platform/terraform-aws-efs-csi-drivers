# Terraform Modules Template

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.18 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.5 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.18 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_efs_csi_role"></a> [efs\_csi\_role](#module\_efs\_csi\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.21.1 |

## Resources

| Name | Type |
|------|------|
| [helm_release.release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_name"></a> [chart\_name](#input\_chart\_name) | Helm chart name to provision | `string` | `"aws-efs-csi-driver"` | no |
| <a name="input_chart_namespace"></a> [chart\_namespace](#input\_chart\_namespace) | Namespace to install the chart into | `string` | `"kube-system"` | no |
| <a name="input_chart_repository"></a> [chart\_repository](#input\_chart\_repository) | Helm repository for the chart | `string` | `"https://kubernetes-sigs.github.io/aws-efs-csi-driver"` | no |
| <a name="input_chart_timeout"></a> [chart\_timeout](#input\_chart\_timeout) | Timeout to wait for the Chart to be deployed. | `number` | `300` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of Chart to install. Set to empty to install the latest version | `string` | `"2.2.6"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of Kubernetes Cluster | `string` | n/a | yes |
| <a name="input_create_default_irsa"></a> [create\_default\_irsa](#input\_create\_default\_irsa) | Create default IRSA for service account | `bool` | `true` | no |
| <a name="input_iam_role_description"></a> [iam\_role\_description](#input\_iam\_role\_description) | Description for IAM role for efs csi | `string` | `"Used by EFS CSI Drivers for EKS"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of IAM role for efs csi | `string` | `""` | no |
| <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path) | IAM Role path for efs csi | `string` | `""` | no |
| <a name="input_iam_role_permission_boundary"></a> [iam\_role\_permission\_boundary](#input\_iam\_role\_permission\_boundary) | Permission boundary ARN for IAM Role for efs csi | `string` | `""` | no |
| <a name="input_iam_role_policy"></a> [iam\_role\_policy](#input\_iam\_role\_policy) | Override the IAM policy for the efs csi | `string` | `""` | no |
| <a name="input_iam_role_tags"></a> [iam\_role\_tags](#input\_iam\_role\_tags) | Tags for IAM Role for efs csi | `map(string)` | `{}` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | Image repository on Dockerhub | `string` | `"amazon/aws-efs-csi-driver"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Image tag | `string` | `"v1.3.8"` | no |
| <a name="input_max_history"></a> [max\_history](#input\_max\_history) | Max History for Helm | `number` | `20` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace, where the service account want to create | `string` | `"kube-system"` | no |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | OIDC Provider ARN for IRSA | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region for the kubernetes cluster. Set to use KIAM or kube2iam for example. | `string` | `""` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name | `string` | `"aws-efs-csi-driver"` | no |
| <a name="input_resources_driver"></a> [resources\_driver](#input\_resources\_driver) | Driver Resources | `map(any)` | <pre>{<br>  "limits": {<br>    "cpu": "200m",<br>    "memory": "200Mi"<br>  },<br>  "requests": {<br>    "cpu": "200m",<br>    "memory": "200Mi"<br>  }<br>}</pre> | no |
| <a name="input_resources_liveness"></a> [resources\_liveness](#input\_resources\_liveness) | LivenessProbe Resources | `map(any)` | <pre>{<br>  "limits": {<br>    "cpu": "100m",<br>    "memory": "100Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "100Mi"<br>  }<br>}</pre> | no |
| <a name="input_resources_registrar"></a> [resources\_registrar](#input\_resources\_registrar) | Registrar Resources | `map(any)` | <pre>{<br>  "limits": {<br>    "cpu": "100m",<br>    "memory": "100Mi"<br>  },<br>  "requests": {<br>    "cpu": "100m",<br>    "memory": "100Mi"<br>  }<br>}</pre> | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of service account to create. Not generated | `string` | `"efs-csi-controller-sa"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |
<!-- END_TF_DOCS -->
