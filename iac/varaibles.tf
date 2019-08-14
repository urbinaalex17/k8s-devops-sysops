variable "gcp_region" {
    description = "GCP Region"
}
variable "gcp_zone" {
    description = "GCP Zone"
}
variable "k8s_master_instance_type" {
    description = "The instance type of the K8s Master"
}
variable "k8s_node_instance_type" {
    description = "The instance type of the K8s Nodes"
}
variable "k8s_image" {
    description = "Boot Disk for K8s Master and Node"
    default = "centos-7-v20190729"
}
