module "security-group" {
  source = "../modules/security-group"
  vpc_id = module.vpc.vpc_id
  eks_cluster_sg_id = module.eks-cluster.cluster_security_group_id
}

module "vpc" {
  source       = "../modules/vpc"
  cluster_name = local.cluster_name



}


module "eks-cluster" {
  source       = "../modules/eks-cluster"
  cluster_name = local.cluster_name
  subnet_ids   = module.vpc.private_subnets
  vpc_id       = module.vpc.vpc_id
  worker_sg_id = module.security-group.all_worker_mgmt_sg_id

}


