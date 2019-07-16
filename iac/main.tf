provider "google" {
  project = "${var.gcp_project}"
  region  = "${var.gcp_region}"
  zone    = "${var.gcp_zone}"
}

resource "google_compute_network" "k8s_network" {
  name                    = "k8s-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "k8s_master_01" {
  name         = "k8s-master-01"
  machine_type = "${var.k8s_instance_type}"

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
}
