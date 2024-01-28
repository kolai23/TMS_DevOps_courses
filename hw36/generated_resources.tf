# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet-subnet01"
resource "google_compute_subnetwork" "vabnet-subnet01" {
  description                = null
  external_ipv6_prefix       = null
  ip_cidr_range              = "172.16.1.0/24"
  ipv6_access_type           = null
  name                       = "vabnet-subnet01"
  network                    = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet"
  private_ip_google_access   = false
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "seismic-vista-405108"
  purpose                    = "PRIVATE"
  region                     = "us-east1"
  role                       = null
  secondary_ip_range         = []
  stack_type                 = "IPV4_ONLY"
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform
resource "google_app_engine_standard_app_version" "default" {
  app_engine_apis           = false
  delete_service_on_destroy = false
  env_variables             = null
  inbound_services          = []
  instance_class            = "F1"
  noop_on_destroy           = false
  project                   = "seismic-vista-405108"
  runtime                   = "python38"
  runtime_api_version       = null
  service                   = "default"
  service_account           = "106483869843-compute@developer.gserviceaccount.com"
  threadsafe                = null
  version_id                = "20240116t212334"
  handlers {
    auth_fail_action            = "AUTH_FAIL_ACTION_REDIRECT"
    login                       = "LOGIN_OPTIONAL"
    redirect_http_response_code = null
    security_level              = "SECURE_OPTIONAL"
    url_regex                   = ".*"
    script {
      script_path = "auto"
    }
  }
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform
resource "google_app_engine_flexible_app_version" "default" {
  beta_settings                = null
  default_expiration           = null
  delete_service_on_destroy    = false
  env_variables                = null
  inbound_services             = []
  instance_class               = null
  nobuild_files_regex          = null
  noop_on_destroy              = false
  project                      = "seismic-vista-405108"
  runtime                      = "python"
  runtime_api_version          = "1"
  runtime_channel              = null
  runtime_main_executable_path = null
  service                      = "default"
  service_account              = "106483869843-compute@developer.gserviceaccount.com"
  serving_status               = "SERVING"
  version_id                   = "20240117t210351"
  deployment {
  }
  handlers {
    auth_fail_action            = "AUTH_FAIL_ACTION_REDIRECT"
    login                       = "LOGIN_OPTIONAL"
    redirect_http_response_code = null
    security_level              = "SECURE_OPTIONAL"
    url_regex                   = ".*"
    script {
      script_path = "PLACEHOLDER"
    }
  }
  liveness_check {
    check_interval    = "30s"
    failure_threshold = 4
    host              = null
    initial_delay     = "300s"
    path              = ""
    success_threshold = 2
    timeout           = "4s"
  }
  manual_scaling {
    instances = 1
  }
  readiness_check {
    app_start_timeout = "300s"
    check_interval    = "5s"
    failure_threshold = 2
    host              = null
    path              = ""
    success_threshold = 2
    timeout           = "4s"
  }
  resources {
    cpu       = 1
    disk_gb   = 10
    memory_gb = 0.5
  }
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform from "projects/seismic-vista-405108/global/networks/vabnet02"
resource "google_compute_network" "vabnet02" {
  auto_create_subnetworks                   = false
  delete_default_routes_on_create           = false
  description                               = null
  enable_ula_internal_ipv6                  = false
  internal_ipv6_range                       = null
  mtu                                       = 1460
  name                                      = "vabnet02"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  project                                   = "seismic-vista-405108"
  routing_mode                              = "REGIONAL"
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform from "seismic-vista-405108"
resource "google_app_engine_application" "default" {
  auth_domain    = "gmail.com"
  database_type  = "CLOUD_DATASTORE_COMPATIBILITY"
  location_id    = "us-central"
  project        = "seismic-vista-405108"
  serving_status = "SERVING"
  feature_settings {
    split_health_checks = true
  }
  timeouts {
    create = null
    update = null
  }
}

# __generated__ by Terraform from "projects/seismic-vista-405108/global/networks/vabnet"
resource "google_compute_network" "vabnet" {
  auto_create_subnetworks                   = false
  delete_default_routes_on_create           = false
  description                               = null
  enable_ula_internal_ipv6                  = false
  internal_ipv6_range                       = null
  mtu                                       = 1460
  name                                      = "vabnet"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  project                                   = "seismic-vista-405108"
  routing_mode                              = "REGIONAL"
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform from "seismic-vista-405108/vabnet/vabnet-vabnet02-peering"
resource "google_compute_network_peering" "vabnet-vabnet02-peering" {
  export_custom_routes                = false
  export_subnet_routes_with_public_ip = true
  import_custom_routes                = false
  import_subnet_routes_with_public_ip = false
  name                                = "vabnet-vabnet02-peering"
  network                             = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet"
  peer_network                        = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet02"
  stack_type                          = "IPV4_ONLY"
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform from "seismic-vista-405108/vabnet02/vabnet02-vabnet-peering"
resource "google_compute_network_peering" "vabnet02-vabnet-peering" {
  export_custom_routes                = false
  export_subnet_routes_with_public_ip = true
  import_custom_routes                = false
  import_subnet_routes_with_public_ip = false
  name                                = "vabnet02-vabnet-peering"
  network                             = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet02"
  peer_network                        = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet"
  stack_type                          = "IPV4_ONLY"
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform from "projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet-subnet02"
resource "google_compute_subnetwork" "vabnet-subnet02" {
  description                = null
  external_ipv6_prefix       = null
  ip_cidr_range              = "172.16.2.0/24"
  ipv6_access_type           = null
  name                       = "vabnet-subnet02"
  network                    = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet"
  private_ip_google_access   = false
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "seismic-vista-405108"
  purpose                    = "PRIVATE"
  region                     = "us-east1"
  role                       = null
  secondary_ip_range         = []
  stack_type                 = "IPV4_ONLY"
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform from "projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet02-subnet01"
resource "google_compute_subnetwork" "vabnet02-subnet01" {
  description                = null
  external_ipv6_prefix       = null
  ip_cidr_range              = "192.168.1.0/24"
  ipv6_access_type           = null
  name                       = "vabnet02-subnet01"
  network                    = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet02"
  private_ip_google_access   = false
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "seismic-vista-405108"
  purpose                    = "PRIVATE"
  region                     = "us-east1"
  role                       = null
  secondary_ip_range         = []
  stack_type                 = "IPV4_ONLY"
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform
resource "google_compute_instance" "instance-3" {
  allow_stopping_for_update = null
  can_ip_forward            = false
  deletion_protection       = false
  description               = null
  desired_status            = null
  enable_display            = false
  guest_accelerator         = []
  hostname                  = null
  labels                    = {}
  machine_type              = "e2-micro"
  metadata = {
    ssh-keys = "q3181309:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHglcFTed06AN0DEOVJ2hEnXUhTDgssre067Pv6Td66fd+1UG/1n4dAAqH9qBPK1Fqc2VUmtsjjeGBGcq7pGIBA= google-ssh {\"userName\":\"q3181309@gmail.com\",\"expireOn\":\"2024-01-16T00:09:08+0000\"}\nq3181309:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLz5DAs8GFv3EdqD06nbj99rLndOPLPFR8BEynzaV/Da0TW2AnpZOJA86t8QMF+2e8hFoEWYWQVWFD5yys9hN82GZ1BzpZbZ1GRgjIgcTlpH6hjaEKtT8V+y4jeOk7Z0k/YyDliXJ1WPEg12/RyzzXdLZoxvmHM+olemlLfzpaV1yYcXOQnNd+Od0WHgfLjX71JVu+EamtoXDKgFqlL9oC0PSOoVf1vA149JbahDhI7ukrUcgf1pwxe4OFOPqMFf7y5nNSCBY9e/ev3uhi46m5gsqIs7GTVKl2wZuj1WITngZJqjLWUhRPukWxcVIsViubl2gCpVVKHhG+pPrQ1R/d google-ssh {\"userName\":\"q3181309@gmail.com\",\"expireOn\":\"2024-01-16T00:09:25+0000\"}"
  }
  metadata_startup_script = null
  min_cpu_platform        = null
  name                    = "instance-3"
  project                 = "seismic-vista-405108"
  resource_policies       = []
  tags                    = []
  zone                    = "us-east1-b"
  boot_disk {
    auto_delete             = true
    device_name             = "instance-3"
    disk_encryption_key_raw = null # sensitive
    kms_key_self_link       = null
    mode                    = "READ_WRITE"
    source                  = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/zones/us-east1-b/disks/instance-3"
    initialize_params {
      enable_confidential_compute = false
      image                       = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-11-bullseye-v20231212"
      labels                      = {}
      provisioned_iops            = 0
      provisioned_throughput      = 0
      resource_manager_tags       = {}
      size                        = 10
      type                        = "pd-standard"
    }
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  network_interface {
    internal_ipv6_prefix_length = 0
    ipv6_address                = null
    network                     = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet02"
    network_ip                  = "192.168.1.2"
    nic_type                    = null
    queue_count                 = 0
    stack_type                  = "IPV4_ONLY"
    subnetwork                  = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet02-subnet01"
    subnetwork_project          = "seismic-vista-405108"
    access_config {
      nat_ip                 = null
      network_tier           = "PREMIUM"
      public_ptr_domain_name = null
    }
  }
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    automatic_restart           = true
    instance_termination_action = null
    min_node_cpus               = 0
    on_host_maintenance         = "MIGRATE"
    preemptible                 = false
    provisioning_model          = "STANDARD"
  }
  service_account {
    email  = "106483869843-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
  timeouts {
    create = null
    delete = null
    update = null
  }
}

# __generated__ by Terraform
resource "google_compute_instance" "instance-1" {
  allow_stopping_for_update = null
  can_ip_forward            = false
  deletion_protection       = false
  description               = null
  desired_status            = null
  enable_display            = false
  guest_accelerator         = []
  hostname                  = null
  labels                    = {}
  machine_type              = "e2-micro"
  metadata = {
    ssh-keys = "q3181309:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAPq5HYBpFjGlu1Xaam15nnQr86GYgsTJDNdIzacSCkI3Ba3wtjzES9gOkms07tJ/+0CUW2QGAWez2EA7zrAvJA= google-ssh {\"userName\":\"q3181309@gmail.com\",\"expireOn\":\"2024-01-15T23:37:30+0000\"}\nq3181309:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDqTXfA5CyhCfOB586MtA5ECw2KHYrD7c1kOoTEizl4kq0whIchjKjAayLggWycZ+M3ZKtcOPxir+x6z7WYDVETFqs5WZkSkD2i63kZ7gqvUDGvjwOf6q+XPpak94qoJp2NgHq8erEGr0sDXhhJPr4d3D+EIGh/140Yk2a75qfttvvHMeRSrEUqaDAWEY+HOS5sEOBunnbxa0JIDC/o3OCz1b8dXGmrRPLnnsucepyOBUxLhUYOaifb9cIS1osiC0JEgvM+P4UcruNVyK091ef7sVbcedELguZ1LiRAsTF3pww97+39o1nPUgVkTNqbFBCYJwRzkLfU/QLI0oQRSDCL google-ssh {\"userName\":\"q3181309@gmail.com\",\"expireOn\":\"2024-01-15T23:37:47+0000\"}"
  }
  metadata_startup_script = null
  min_cpu_platform        = null
  name                    = "instance-1"
  project                 = "seismic-vista-405108"
  resource_policies       = []
  tags                    = ["http-server", "https-server"]
  zone                    = "us-east1-c"
  boot_disk {
    auto_delete             = true
    device_name             = "instance-4"
    disk_encryption_key_raw = null # sensitive
    kms_key_self_link       = null
    mode                    = "READ_WRITE"
    source                  = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/zones/us-east1-c/disks/instance-1"
    initialize_params {
      enable_confidential_compute = false
      image                       = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20240112"
      labels                      = {}
      provisioned_iops            = 0
      provisioned_throughput      = 0
      resource_manager_tags       = {}
      size                        = 10
      type                        = "pd-standard"
    }
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  network_interface {
    internal_ipv6_prefix_length = 0
    ipv6_address                = null
    network                     = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/global/networks/vabnet"
    network_ip                  = "172.16.2.2"
    nic_type                    = null
    queue_count                 = 0
    stack_type                  = "IPV4_ONLY"
    subnetwork                  = "https://www.googleapis.com/compute/v1/projects/seismic-vista-405108/regions/us-east1/subnetworks/vabnet-subnet02"
    subnetwork_project          = "seismic-vista-405108"
    access_config {
      nat_ip                 = null
      network_tier           = "PREMIUM"
      public_ptr_domain_name = null
    }
  }
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    automatic_restart           = true
    instance_termination_action = null
    min_node_cpus               = 0
    on_host_maintenance         = "MIGRATE"
    preemptible                 = false
    provisioning_model          = "STANDARD"
  }
  service_account {
    email  = "106483869843-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
  timeouts {
    create = null
    delete = null
    update = null
  }
}
