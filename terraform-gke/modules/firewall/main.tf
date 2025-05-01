resource "google_compute_firewall" "gke_firewall" {
  name    = "${var.env_prefix}-firewall"
  network = var.vpc_id

  allow {
    protocol = "tcp"
    ports    = ["22", "443", "10250", "30000-32767"]
  }

  source_ranges = ["0.0.0.0/0"] // chnage later as these ports should not be open to the public especially 10250
}