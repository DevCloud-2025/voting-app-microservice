variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string

}

variable "kubernetes_version" {
  default     = 1.27
  description = "kubernetes version"
  type        = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "worker_sg_id" {
  type = string
}


variable "cluster_endpoint_public_access" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}