provider "helm" {
  kubernetes {
    host     = "${var.master_endpoint}"

    client_certificate     = "${var.client_certificate}"
    client_key             = "${var.client_key}"
    cluster_ca_certificate = "${var.cluster_ca_certificate}"
  }
}

resource "helm_release" "mydatabase" {
  count = "${var.deploy_location == "gke" || var.deploy_location == "kubernetes" ? 1 : 0}"
  name      = "mydatabase"
  chart     = "stable/mariadb"

  set {
    name  = "mariadbUser"
    value = "foo"
  }

  set {
    name = "mariadbPassword"
    value = "qux"
  }
}