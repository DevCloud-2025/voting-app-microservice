terraform {
  required_version = ">=1.2.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.14.0, < 7.0.0"

    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "kubernetes" {
  host                   = ""
  token                  = ""
  cluster_ca_certificate = ""
  alias                  = "gke"
}