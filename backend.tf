terraform {
  backend "gcs" {
    bucket = "chaos-engineering-308202-tfstate"
    credentials = "./creds/demoaccount.json"
  }
}