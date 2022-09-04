output "argocd_manifest" {
  value = module.platform_chart.argocd_metadata
}

output "argocd_apps_manifest" {
  value = module.platform_chart.argocd_apps_metadata
}