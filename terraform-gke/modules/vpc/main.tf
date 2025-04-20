resource "google_compute_network" "vpc_network" {
  name                    = "${var.env_prefix}-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gke_subnet" {
  name          = "${var.env_prefix}-subnet"
  ip_cidr_range = var.cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.id
  
  secondary_ip_range {
    range_name    = var.pods_range_name
    ip_cidr_range =  var.pods_cidr
  }

  secondary_ip_range {
    range_name    = var.services_range_name
    ip_cidr_range = var.services_cidr
  }
}