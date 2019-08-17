##### GENERATE THE ANSIBLE INVENTORY FILE

resource "null_resource" "generate_ansible_inventory_file" {
  provisioner "local-exec" {
    command = <<EOD
    cat <<EOF > "../ansible/hosts"
[k8s-master-01]
${google_compute_instance.k8s_master_01.network_interface[0].access_config[0].nat_ip} kubernetes_role="master"

[k8s-node-01]
${google_compute_instance.k8s_node_01.network_interface[0].access_config[0].nat_ip} kubernetes_role="node"

[k8s-node-02]
${google_compute_instance.k8s_node_02.network_interface[0].access_config[0].nat_ip} kubernetes_role="node"
EOF
    EOD
  }
}