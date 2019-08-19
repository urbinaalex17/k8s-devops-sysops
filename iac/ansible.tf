#ANSIBLE PLAYBOOKS

## CHECK CONNECTIVITY PRIOR TO EXECUTE PLAYBOOKS
resource "null_resource" "ansible_connection_wait" {
  depends_on = ["google_compute_instance.k8s_master_01"]
  provisioner "local-exec" {
    command = "export ANSIBLE_CONFIG=${var.ansible_cfg} ansible-playbook -u ${var.ssh_user} ../ansible/playbooks/connection-wait.yml -e target=all"
  }
}

## EXECUTE INSTALL KUBERNETES PLAYBOOK AGAINST KUBERNETES CLUSTER
resource "null_resource" "ansible_install_kubernetes" {
  depends_on = ["null_resource.ansible_connection_wait"]
  provisioner "local-exec" {
    command = "export ANSIBLE_CONFIG=${var.ansible_cfg} ansible-playbook -u ${var.ssh_user} ../ansible/playbooks/install-kubernetes.yml -e target=all"
  }
}

