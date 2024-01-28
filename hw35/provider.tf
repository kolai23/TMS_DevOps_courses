provider "google" {
  credentials = "./vabischevich-terraform.json"
  project     = "seismic-vista-405108"
  region      = var.region
  zone        = "us-central1-a"
}
