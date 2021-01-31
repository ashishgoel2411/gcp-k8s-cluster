terraform {
  backend "gcs" {
    bucket = "stoked-genius-302113-tfstate"
    credentials = "./creds/demoaccount.json"
  }
}