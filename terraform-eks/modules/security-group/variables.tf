variable "vpc_id" {
  description = "VPC ID"
  type        = string

}

variable "eks_cluster_sg_id" {
  description = "EKS Control Plane Security Group ID"
  type        = string
}