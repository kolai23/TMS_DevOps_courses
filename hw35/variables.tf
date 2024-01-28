variable "region" {
  default = "us-central1-01"
}

variable "zone" {
  default = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

variable "machine_type" {
  type    = string
  default = "e2-small"
}

variable "size_disk" {
  type    = number
  default = 10
}

variable "family_image" {
  default = "debian-11"
}
variable "project_image" {
  default = "debian-cloud"
}
variable "disk_type" {
  default = "pd-standard"
}
variable "enable_public_ip" {
  type    = bool
  default = true
}

variable "network" {
  default = "default"
}
