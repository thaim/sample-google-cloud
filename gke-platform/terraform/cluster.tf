resource "google_container_cluster" "this" {
  project = data.google_project.this.project_id

  name                = "sample-gke-platform"
  location            = "asia-northeast1"
  deletion_protection = false

  initial_node_count = 1

  network    = google_compute_network.vpc.self_link
  subnetwork = google_compute_subnetwork.subnet.self_link
}
