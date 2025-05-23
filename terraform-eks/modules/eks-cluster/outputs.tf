# output "cluster_id" {
#   description = "EKS cluster ID."
#   value       = module.eks-cluster.cluster_id
# }

# output "cluster_endpoint" {
#   description = "Endpoint for EKS control plane."
#   value       = module.eks-cluster.cluster_endpoint
# }

# output "cluster_security_group_id" {
#   description = "Security group ids attached to the cluster control plane."
#   value       = module.eks-cluster.cluster_security_group_id
# }



# output "oidc_provider_arn" {
#   value = module.eks-cluster.oidc_provider_arn
# }


output "cluster_id" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

