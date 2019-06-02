resource "google_container_cluster" "forseti" {
  count = "${var.deploy_location == "gke" ? 1 : 0}"
  name = "forseti"
  location = "us-central1"

  initial_node_count = 1
}

resource "google_container_node_pool" "primary-pool" {
  count      = "${var.deploy_location == "gke" ? 1 : 0}"
  name       = "primary-pool"
  location   = "us-central1"
  cluster    = "${google_container_cluster.forseti.0.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}