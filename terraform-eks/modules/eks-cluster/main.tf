# module "eks" {
#   source                                   = "terraform-aws-modules/eks/aws"
#   version                                  = "20.8.4"
#   cluster_name                             = var.cluster_name
#   cluster_version                          = var.kubernetes_version
#   subnet_ids                               = var.subnet_ids
#   create_iam_role                          = true
#   iam_role_name                            = "${var.cluster_name}-eks-cluster"
#   enable_cluster_creator_admin_permissions = true

#   iam_role_additional_policies = {
#     additional = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   }


#   enable_irsa = true

#   tags = {
#     cluster = "demo"
#   }

#   vpc_id = var.vpc_id


#   eks_managed_node_group_defaults = {
#     ami_type               = "AL2_x86_64"
#     instance_types         = ["t3.medium"]
#     vpc_security_group_ids = [var.worker_sg_id]
#   }

#   eks_managed_node_groups = {

#     node_group = {
#       min_size     = 2
#       max_size     = 6
#       desired_size = 2
#     }
#   }
# }




data "aws_caller_identity" "current" {}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name                             = var.cluster_name
  cluster_version                          = var.kubernetes_version
  subnet_ids                               = var.subnet_ids
  vpc_id                                   = var.vpc_id
  create_iam_role                          = true
  iam_role_name                            = "${var.cluster_name}-eks-cluster"
  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true
  cluster_endpoint_public_access         = true
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access
  

  iam_role_additional_policies = {
    additional = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  }
  access_entries = {
    # One access entry with a policy associated
    example = {
      principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }

  tags = {
    cluster = "demo"
  }

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [var.worker_sg_id]
    disk_size              = 20 # Add this to avoid default failures
    capacity_type          = "ON_DEMAND"
  }

  eks_managed_node_groups = {
    node_group = {
      name         = "default-node-group"
      desired_size = 2
      min_size     = 2
      max_size     = 6

      # Optional but can be helpful
      subnet_ids = var.subnet_ids

      # Enable SSH (optional)
      # remote_access = {
      #   ec2_ssh_key               = var.ssh_key_name
      #   source_security_group_ids = [var.bastion_sg_id] # Optional for access
      # }

      tags = {
        Name = "eks-node-group"
      }
    }
  }
}