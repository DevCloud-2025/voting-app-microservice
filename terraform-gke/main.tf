module "vpc_network" {
  source              = "./modules/vpc"
  region              = var.region
  env_prefix          = var.env_prefix
  cidr_range          = var.cidr_range
  pods_cidr           = var.pods_cidr
  services_cidr       = var.services_cidr
  pods_range_name     = var.pods_range_name
  services_range_name = var.services_range_name
}

module "firewall" {
  source     = "./modules/firewall"
  vpc_id     = module.vpc_network.vpc.id
  env_prefix = var.env_prefix
  depends_on = [module.vpc_network]

}

module "gke" {
  source              = "./modules/gke-cluster"
  project_id          = var.project_id
  env_prefix          = var.env_prefix
  region              = var.region
  zones               = var.zones
  vpc_id              = module.vpc_network.vpc.name
  subnetwork          = module.vpc_network.subnetwork.name
  pods_range_name     = var.pods_range_name
  services_range_name = var.services_range_name
}