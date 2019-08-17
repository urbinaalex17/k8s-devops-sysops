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
variable "ssh_user" {
    description = "SSH User to connect to the instances"
    default = "ansible"
}
variable "ssh_pub_key_file" {
    description = "SSH Public File to connect to the instances"
    default = "../keypairs/KUBERNETES-KEYPAIR.pub"
}
variable "ssh_priv_key_file" {
    description = "SSH Private File to connect to the instances"
    default = "../keypairs/KUBERNETES-KEYPAIR"
}