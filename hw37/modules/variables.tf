variable "region" {
  default = "us-west1"
}

variable "zone" {
  default = ["us-west1"]
}

variable "machine_type" {
  type    = string
  default = "e2-small"
}

variable "size_disk" {
  type    = number
  default = 10
}