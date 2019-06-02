variable "deploy_location" {
  description = "Where to deploy Forseti to, gce or gke"
  default     = "gce"
}

variable "client_certificate" {
  default = ""
}

variable "client_key" {
  default = ""
}

variable "cluster_ca_certificate" {
  default = ""
}

variable "master_endpoint" {
  default = ""
}