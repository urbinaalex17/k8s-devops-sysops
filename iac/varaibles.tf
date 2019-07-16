variable "gcp_project" {
    description = "GCP Project"
}
variable "gcp_region" {
    description = "GCP Region"
}
variable "gcp_zone" {
    description = "GCP Zone"
}
variable "k8s_instance_type" {
    description = "The instance type of the K8s Master and Node instances"
}
variable "k8s_image" {
    description = "Boot Disk for K8s Master and Node"
    default = "ubuntu-1804-bionic-v20190628"
}
