terraform {
  backend "gcs" {
    bucket = "chaos-engineering-354117-tfstate"
    credentials = "./creds/demoaccount.json"
  }
}
