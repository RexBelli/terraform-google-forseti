output "client_certificate" {
  description = "Kubernetes cluster client certificate"
  value       = "${element(concat(google_container_cluster.forseti.*.master_auth.0.client_certificate, list("")), 0)}"
}

output "client_key" {
  description = ""
  value       = "${element(concat(google_container_cluster.forseti.*.master_auth.0.client_key,list("")),0)}"
}

output "cluster_ca_certificate" {
  description = ""
  value       = "${element(concat(google_container_cluster.forseti.*.master_auth.0.cluster_ca_certificate,list("")),0)}"
}

output "master_endpoint" {
  description = ""
  value       = "${element(concat(google_container_cluster.forseti.*.endpoint,list("")),0)}"
}
