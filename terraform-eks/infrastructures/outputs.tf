output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks-cluster.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks-cluster.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks-cluster.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "oidc_provider_arn" {
  value = module.eks-cluster.oidc_provider_arn
}


output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "value of the VPC ID"
}

