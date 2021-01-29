provider "google" {
#  credentials = file("demoaccount.json")
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

