data "google_compute_image" "debian_image" {
  family  = var.family_image
  project = var.project_image
}

resource "google_compute_instance" "instance-web" {
  for_each     = toset(var.zone)
  tags         = ["http-server", "https-server"]
  zone         = each.key
  machine_type = var.machine_type
  name         = "vm-instance-${each.key}"

  boot_disk {
    auto_delete = true
    
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
      size  = var.size_disk
      type  = var.disk_type
    }

  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  metadata = {
    startup-script = "sudo apt update && sudo install python3.11 build-essential default-libmysqlclient-dev pkg-config python3.11-dev python3.11-venv \n cd /var/www/clinic/portal \n python3.11 -m venv .venv\n . .venv/bin/activate\n pip3 install -r requirements.txt\n python3 manage.py runserver 0.0.0.0:8000"
  }

  network_interface {

    dynamic "access_config" {
      for_each = var.enable_public_ip == true ? [1] : []

      content {
        network_tier = "PREMIUM"
      }
    }
    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/seismic-vista-405108/regions/us-central1/subnetworks/default"
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


  depends_on = [time_sleep.delay]

}

output "ip_addresses" {
  value     = join(", ", [for instance in google_compute_instance.instance-web : instance.network_interface[0].access_config[0].nat_ip])
  sensitive = false
}

resource "time_sleep" "delay" {
  create_duration = "30s"
}


data "http" "current_ip" {
  url = "https://checkip.amazonaws.com/"
}


resource "google_compute_firewall" "default" {
  name        = "hw35-firewall"
  network     = var.network
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["${chomp(data.http.current_ip.response_body)}/32"]
  target_tags   = ["http"]
}

resource "null_resource" "stop_node" {
  for_each   = toset(var.zone)
  depends_on = [google_compute_instance.instance-web]
  provisioner "local-exec" {
    command     = "gcloud compute instances stop --zone=${each.key} vm-instance-${each.key}"
    interpreter = ["/bin/bash", "-c"]
  }
}
