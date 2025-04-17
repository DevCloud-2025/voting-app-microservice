output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "value of the VPC ID"
}

output "private_subnets" {
  value = module.vpc.private_subnets

}
