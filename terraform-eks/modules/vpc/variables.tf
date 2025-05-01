variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string

}