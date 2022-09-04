output "argocd_metadata" {
  description = "Block status of the deployed release."
  value       = module.argocd_release.metadata
}

output "argocd_apps_metadata" {
  description = "Block status of the deployed release."
  value       = module.argocd_apps_release.metadata
}