data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  alias                  = "gke"
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = "${var.env_prefix}-cluster"
  region                     = var.region
  zones                      = var.zones
  network                    = var.vpc_id
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.pods_range_name
  ip_range_services          = var.services_range_name
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  dns_cache                  = false
  deletion_protection = false


}