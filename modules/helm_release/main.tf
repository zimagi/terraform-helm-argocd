# locals {
#   argocd_values_files = appen
#   helm_charts = {
#     argocd = {
#       name       = lookup(var.argocd_chart, "name", "argo-cd")
#       chart      = lookup(var.argocd_chart, "chart", "argo-cd")
#       repository = lookup(var.argocd_chart, "repository", "https://argoproj.github.io/argo-helm")
#       version    = lookup(var.argocd_chart, "version", "4.10.6")
#       values = lookup(var.argocd_chart, "values", tolist(["${file("${path.module}/helm/argocd_values.yaml")}", "${file("${path.root}/helm/argocd_values.yaml")}"]))
#       namespace = lookup(var.argocd_chart, "namespace", "argo-cd")
#       create_namespace = lookup(var.argocd_chart, "create_namespace", true)
#     }
#     argocd_apps = {
#       name       = lookup(var.argocd_apps_chart, "name", "argocd-apps")
#       chart      = lookup(var.argocd_apps_chart, "chart", "argocd-apps")
#       repository = lookup(var.argocd_apps_chart, "repository", "https://charts.zimagi.com")
#       version    = lookup(var.argocd_apps_chart, "version", "1.0.3")
#       values = lookup(var.argocd_apps_chart, "values", tolist(["${file("${path.module}/helm/argocd_apps_values.yaml")}"]))
#       namespace = lookup(var.argocd_apps_chart, "namespace", "argo-cd")
#       create_namespace = lookup(var.argocd_apps_chart, "create_namespace", true)
#     }
#   }
# }

resource "helm_release" "this" {
  # Allows var.name to be empty, which is allowed to be the case for this module since var.name is optional in eks-iam-role.
  # For more information, see: https://github.com/cloudposse/terraform-aws-eks-iam-role
  name = coalesce(var.release_name, var.chart)

  chart       = var.chart
  description = var.description
  devel       = var.devel
  version     = var.chart_version

  repository           = var.repository
  repository_ca_file   = var.repository_ca_file
  repository_cert_file = var.repository_cert_file
  repository_key_file  = var.repository_key_file
  repository_password  = var.repository_password
  repository_username  = var.repository_username

  # Note: creating a namespace here will not allow creation of labels/annotations
  # For that, a `kubernetes_namespace` resource would have to be created.
  # See https://github.com/hashicorp/terraform-provider-helm/issues/584#issuecomment-689555268
  create_namespace = var.create_namespace
  namespace        = var.kubernetes_namespace

  atomic                     = var.atomic
  cleanup_on_fail            = var.cleanup_on_fail
  dependency_update          = var.dependency_update
  disable_openapi_validation = var.disable_openapi_validation
  disable_webhooks           = var.disable_webhooks
  force_update               = var.force_update
  keyring                    = var.keyring
  lint                       = var.lint
  max_history                = var.max_history
  recreate_pods              = var.recreate_pods
  render_subchart_notes      = var.render_subchart_notes
  replace                    = var.replace
  reset_values               = var.reset_values
  reuse_values               = var.reuse_values
  skip_crds                  = var.skip_crds
  timeout                    = var.timeout
  values                     = var.values
  verify                     = var.verify
  wait                       = var.wait
  wait_for_jobs              = var.wait_for_jobs

  dynamic "set" {
    for_each = var.set
    content {
      name  = set.value["name"]
      value = set.value["value"]
      type  = set.value["type"]
    }
  }

  dynamic "set_sensitive" {
    for_each = var.set_sensitive
    content {
      name  = set_sensitive.value["name"]
      value = set_sensitive.value["value"]
      type  = set_sensitive.value["type"]
    }
  }

  dynamic "postrender" {
    for_each = var.postrender_binary_path != null ? [1] : []

    content {
      binary_path = var.postrender_binary_path
    }
  }
}