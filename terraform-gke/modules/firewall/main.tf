resource "google_compute_firewall" "gke_firewall" {
  name    = "${var.env_prefix}-firewall"
  network = var.vpc_id

  allow {
    protocol = "tcp"
    ports    = ["22", "443", "10250", "30000-32767"]
  }

  source_ranges = ["0.0.0.0/0"]
}