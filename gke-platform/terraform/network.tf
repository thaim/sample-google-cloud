resource "google_compute_network" "vpc" {
  project = data.google_project.this.project_id

  name                    = "sample-gke"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  project = data.google_project.this.project_id

  region                   = "asia-northeast1"
  name                     = var.project_name
  ip_cidr_range            = "10.10.0.0/20"
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}
