output vpc {
    value = google_compute_network.vpc_network
}

output subnetwork {
    value = google_compute_subnetwork.gke_subnet
}