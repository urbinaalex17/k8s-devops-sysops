provider "google" {
  region  = "${var.gcp_region}"
  zone    = "${var.gcp_zone}"
}

resource "google_compute_firewall" "k8s_firewall" {
  name    = "k8s-allow-ssh-icmp-http"
  network = "${google_compute_network.k8s_network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
}

resource "google_compute_firewall" "k8s_firewall_allow_internal" {
  name    = "k8s-allow-internal-traffic"
  network = "${google_compute_network.k8s_network.name}"

  allow {
    protocol = "all"
  }

  source_ranges = ["${data.google_compute_subnetwork.k8s_subnetwork_data.ip_cidr_range}"]

}


resource "google_compute_network" "k8s_network" {
  name                    = "k8s-network"
  auto_create_subnetworks = "true"
}

data "google_compute_subnetwork" "k8s_subnetwork_data" {
  name = "${google_compute_network.k8s_network.name}"
  region = "${var.gcp_region}"
}

resource "google_compute_instance" "k8s_master_01" {
  name         = "k8s-master-01"
  machine_type = "${var.k8s_master_instance_type}"

  boot_disk {
    initialize_params {
      image = "${var.k8s_image}"
    }
  }

  network_interface {
    network       = "${google_compute_network.k8s_network.self_link}"
    access_config {
    }
  }

  metadata = {
    sshKeys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }

}

resource "google_compute_instance" "k8s_node_01" {
  name         = "k8s-node-01"
  machine_type = "${var.k8s_node_instance_type}"

  boot_disk {
    initialize_params {
      image = "${var.k8s_image}"
    }
  }

  network_interface {
    network       = "${google_compute_network.k8s_network.self_link}"
    access_config {
    }
  }

  metadata = {
    sshKeys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }

}

resource "google_compute_instance" "k8s_node_02" {
  name         = "k8s-node-02"
  machine_type = "${var.k8s_node_instance_type}"

  boot_disk {
    initialize_params {
      image = "${var.k8s_image}"
    }
  }

  network_interface {
    network       = "${google_compute_network.k8s_network.self_link}"
    access_config {
    }
  }
  
  metadata = {
    sshKeys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }
  
}
