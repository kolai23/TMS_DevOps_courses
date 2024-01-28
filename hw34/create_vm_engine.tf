provider "google" {
  credentials = "./vabischevich-terraform.json"
  project     = "seismic-vista-405108"
  region      = "us-central1"
  zone        = "us-central1-a"


}
resource "google_compute_instance" "instance-web" {
  boot_disk {
    auto_delete = true
    device_name = "instance-web"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2310-mantic-arm64-v20231215"
      size  = 12
      type  = "pd-standard"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-small"

  metadata = {
    startup-script = "sudo apt update"
  }

  name = "instance-5"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/seismic-vista-405108/regions/us-central1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = ["http-server", "https-server"]
  zone = "us-central1-a"
}
