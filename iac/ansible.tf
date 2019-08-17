#ANSIBLE PLAYBOOKS

## CHECK CONNECTIVITY PRIOR TO EXECUTE PLAYBOOKS
resource "null_resource" "ansible_connection_wait" {
  depends_on = ["google_compute_instance.k8s_master_01"]
  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/hosts -u ${var.ssh_user} --private-key ${var.ssh_priv_key_file} ../ansible/playbooks/connection-wait.yml -e target=all"
  }
}

## EXECUTE INSTALL KUBERNETES PLAYBOOK AGAINST KUBERNETES CLUSTER
resource "null_resource" "ansible_install_kubernetes" {
  depends_on = ["null_resource.ansible_connection_wait"]
  provisioner "local-exec" {
    command = "ansible-playbook -i ../ansible/hosts -u ${var.ssh_user} --private-key ${var.ssh_priv_key_file} ../ansible/playbooks/install-kubernetes.yml -e target=all"
  }
}

