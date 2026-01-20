provider "google" {
  project = var.project_id
  region  = "asia-northeast1-c"
}

resource "google_compute_instance" "vm_example" {
  count        = var.instance_count
  name         = "vm-${count.index}"
  machine_type = "e2-micro"
  zone         = "asia-northeast1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}