resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.compute
  zone         = var.zone

  boot_disk {
    source = google_compute_disk.disk.name
    auto_delete = false
  }
  
  metadata_startup_script = ""

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "TERMINATE"
    preemptible         = false
  }

  guest_accelerator {
    type = var.accelerator
    count = var.num_gpu
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.name

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  provisioner "remote-exec" {
    script = var.script_path

    connection {
      type        = "ssh"
      host        = google_compute_address.static.address
      user        = var.username
      private_key = file(var.private_key_path)
    }
  }
}

provider "google" {
  credentials = file(var.auth_json)
  project     = var.project_id
  region      = var.region
}

resource "google_compute_disk" "disk" {
  name  = var.disk_id
  size  = 5000 //5 GB
  image = "debian-cloud/debian-10"
  type  = var.pd_disk
  zone  = var.zone
}

