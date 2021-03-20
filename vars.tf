variable "project" {
  default = "chaos-engineering-308202"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "credentials" {
  default = "./creds/demoaccount.json"
}

variable "machine_type" {
  default = "n1-standard-2"
}

variable "pod_cidr" {
  type        = string
  default     = "10.2.0.0/16"
  description = "POD CIDR range for cluster"
}

variable "service_cidr" {
  type        = string
  default     = "10.3.0.0/16"
  description = "Service internal IPs range for the cluster"
}

variable "k8s_version" {
  type        = string
  default     = "1.19.6"
  description = <<EOF
  Kubernetes version to use, be careful changing it, 
  as other softwares like docker / containerd etc are using hardcoded Versions
  EOF 
}

variable "cni_provider" {
  type        = string
  default     = "weavenet"
  description = "CNI provider is weavenet"
}

variable "num_of_worker_nodes" {
  type        = number
  default     = 2
  description = "Total numbers of worker nodes to be created"
}

variable "token_bucket" {
  type        = string
  default     = "k8s-master-token-bucket"
  description = "Bucket to store token to join master"
}

variable "SVC_ACCOUNT_KEY" {
  type        = string
  default     = "ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAiY2hhb3MtZW5naW5lZXJpbmctMzA4MjAyIiwKICAicHJpdmF0ZV9rZXlfaWQiOiAiMjM4M2JlZmIzMDY3YzA5NmNhZDYxZDAwZjMzNTEzMGY5YWYxYWU3MCIsCiAgInByaXZhdGVfa2V5IjogIi0tLS0tQkVHSU4gUFJJVkFURSBLRVktLS0tLVxuTUlJRXZ3SUJBREFOQmdrcWhraUc5dzBCQVFFRkFBU0NCS2t3Z2dTbEFnRUFBb0lCQVFER1d5MGNtd3U1TEdNQVxuUHE4U0s3L09rcHFBZVFKVEhieXBQbzI1a09aaGo1VmRMZTQvN3FDcmY0QlZ5NU54aExpMlR4R1NsM1lTbHZORFxuN014SjZiVTErbnhmeUdsYXpXZ3gwUXpLN25maEV4VnhjMEV3UDdJbFA5M1ppdjlLWG4zbFZyTEdTS3psSFNxMFxuVTJ4cFpNV29DZ3hoYkg5aU9vTStvZGVmMTc5KzJCSEhYM3VoTFhGVjd5RFRpYXpNQXNydHpGVDlGeTE5UE1iTVxueTVpK0F3VzNjcm5XeVd6RDYvMTdra2ZDQWhKMGc3WXFmMWZXRGRzOXFFa3BnYTNIalhrTnZqTSthWlBzd0xtTFxuUjNwdDBjOGNadWRHUjNNRmdOa0NMTWZva3VBSXR3THUyVk1sVnRHRTM5cE1iMUNJenNjT3Y0bWJXSlVoRnhJbVxuYkREd1pnZlBBZ01CQUFFQ2dnRUFRd1AvQTlFbWJ0T2VSekRtZVY4cW1LSlRiT0IxZHB0dmFFYm9IeS9qaGthNlxua2hhNGpnVVRaNTNXUUNaZGxGYmhDVWRCaXFOOWt0NUpKa1BVNll2NlcxaGJ1UWkrLzV5eWZWSkIzallmYm4zQ1xuR3VoenQ5ZHRXc1J2TWRhU1ZoQUN2UDlEdTFaR2c4b002WXZkN3VYTEdmRDdLZGM4V25XbWJmekVHdzhMZGREMVxuWi9Ja2tVVHc2OG5ydkNmUG0rWUorTy9UaUZNbmNiYlp1YStWeWRNZEt3TTEzczNxd3oyNC8wS09qSTJTQ3VtaVxucm9LSXBPM1IrL0lkbGVWcHNpcUZOcEVOY3l1Y0Jja2xIY25HeTh0REtPTDQxY0F5MUh1TFFXYVVzK3R1R3Bid1xuRTJhYldUZjhRa1dPQXVuazFpQ2tkWjRwS2ladFhUTXFtOHlCZlZuZUFRS0JnUUQ2RzltRFdMMmFCckZzc1luMFxuZStMZjMybUkzb0tlUTdSOGZsRkJKcWE3RDVMWUJjUmJkUXhuTkVyNzFXdU9UTmw2RERMRXhPQkU4SnNONWVOOFxuVnhSaG5nM0FFVU9GWFRwL0d2MW1RS01hbVFENmdIMGsrczNxZFRsL1lGM1RsUkYwRzVsUTluK2c1SEozWnpVYVxuVm1qWllTSjUwblR3NldQTmZHSDhkTGhUVHdLQmdRRExCMEpscWU1ZTJkVmFWKzJZQ1RXRVdvSy9vWXN5ZDJoTFxuT2F5NytpSXhxR2JwdVh1SXdDWlJxT05LTFZVUjVYRnMxbnlXcmpvenRJY3dyR2JvM0JCbFI4eFdMVXhiMHJzVFxuL3lMSkI3akRyamluQURBdUg1OFNZWXlvLzFaOEkwM0FHTyt4S1F0VzVKN2VCY05pRDlXbmZ0UGE4YWtmSDRlMFxucjdFMkFzdmpnUUtCZ1FEc1Z1N0dzRStTUWVyYzVET1JoSlBScTBNRnBBWFgyZkN1aDRydXZzQmxHWVZRZnJxYlxuRmRNZm53bVFTWTgyUzZaaUx5NjJRN2dOVFRPb0FXbGlzTUxBcitNY2NQUFdEVS9lbGptSHEySzFHb29UTE9HVVxuMVM5SjgzWGV5TWhBektkT2lWbnFhTlFYekdmaUx2TytMSk10ZngxZDhxS3dtRXJIL1ZaMmdqRS8vd0tCZ1FDdFxuNWd2akZFaE9DZnNLcE9Hbkpjd25EM2VLT0E0SUxlcXc5RGVWMHN2VENORU5SSWdoTzZRV3NiZnM0eU5JYnVSV1xuT3VrQUR6OWU1alFkWnEzR3FpZUkrSlIzQTlteGxMQVVrcVh5MXFCVlN6YlBKQVFnbllrY3IxMVJxMU1paFFLbFxubFRaSTRrVUtLa3hCRTJLazdiY3MvaDdzRzYybU1OV0YyQzdMZWwyMUFRS0JnUUNtUVJEdGtFRjUxT3ViMW5Eb1xuRlVFUEhnT21MTFlnRkFaWU5QR0JMYTJIWXJ4SjhiVlk0YzQrSTJvaXp2aENpNTBUUUhnV0h1dGFEQnJRa0VzVFxucXVXOHpPdlpienZxVlh5SjR0QTB2cUdFa0JhbmhIV2p6cmhFeXBxUGdEV2J5bmtpZzZoM3VQZEU0UzhncjBHVFxudzJJT21EVlFDVGdWbjVSMjZXWTFaZ2x0QWc9PVxuLS0tLS1FTkQgUFJJVkFURSBLRVktLS0tLVxuIiwKICAiY2xpZW50X2VtYWlsIjogImRlbW9hY2NvdW50QGNoYW9zLWVuZ2luZWVyaW5nLTMwODIwMi5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsCiAgImNsaWVudF9pZCI6ICIxMTcyNTk0MDcwMDI5OTk4NTY4MjQiLAogICJhdXRoX3VyaSI6ICJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20vby9vYXV0aDIvYXV0aCIsCiAgInRva2VuX3VyaSI6ICJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS90b2tlbiIsCiAgImF1dGhfcHJvdmlkZXJfeDUwOV9jZXJ0X3VybCI6ICJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9vYXV0aDIvdjEvY2VydHMiLAogICJjbGllbnRfeDUwOV9jZXJ0X3VybCI6ICJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9yb2JvdC92MS9tZXRhZGF0YS94NTA5L2RlbW9hY2NvdW50JTQwY2hhb3MtZW5naW5lZXJpbmctMzA4MjAyLmlhbS5nc2VydmljZWFjY291bnQuY29tIgp9Cg=="
  description = "service account encrypted key"
}


variable "user_name" {
  type        = string
  default     = "demo"
  description = "demo user"
}

variable "user_pass" {
  type        = string
  default     = "demo123"
  description = "Password of demo user"
}

variable "GREMLIN_TEAM_ID" {
  type        = string
  default     = "6a95d297-1bae-5bce-90b0-200632673621"
  description = "Gremlin team ID"
}

variable "GREMLIN_TEAM_SECRET" {
  type        = string
  default     = "33759aed-b315-4076-b59a-edb31540768e"
  description = "Gremlin team Secret"
}