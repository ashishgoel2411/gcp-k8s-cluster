variable "project" {
  default = "stoked-genius-302113"
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
  default     = "k8s-token-bucket"
  description = "Bucket to store token to join master"
}

variable "SVC_ACCOUNT_KEY" {
  type        = string
  default     = "ewogICAgInR5cGUiOiAic2VydmljZV9hY2NvdW50IiwKICAgICJwcm9qZWN0X2lkIjogInN0b2tlZC1nZW5pdXMtMzAyMTEzIiwKICAgICJwcml2YXRlX2tleV9pZCI6ICI0NzFkMjczZjkwYTgzNzE4NTJiZDAyZTNmMmM3NTg4MGZhOTgxMjQ1IiwKICAgICJwcml2YXRlX2tleSI6ICItLS0tLUJFR0lOIFBSSVZBVEUgS0VZLS0tLS1cbk1JSUV2Z0lCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQktnd2dnU2tBZ0VBQW9JQkFRRFlPOExKZlZCbVlMdjJcbjRwRlBrNjlyN1A2RndSbTNFY1EwbUZlTzZaOU1QbGlmbUdYQ3JKeW14N0V3VEpMeWNHcHBXc3RqVGRVb2dzckZcblYrWTR1Z3FDT3VyU3UzVklZT0pUYXdoVW5OdCtZeDlJVDlXSmtxeTdORm8zUGpjeW9lMUZ4QjFrbUFqTEVHbXpcblBpd0RPZzJGbXpsaWRTRFNiS3dYMGhuSzdHZWxsMThYSWd3OGxDMUhsV1l6MDF5YWYyRnhUVWFDRjRoUG91SEdcbjFOZUlFM2cyVC9lZUZGVW9hTzdSc0I5SC9nZFA1SWJ5aE5Ya2xKVmJxMDJ3cE9mRnRvSzJVOTVKOE5vUUdYOW5cbmkvSEU3eEpaZ05jcnJRL1gveUdFemZnUHYvbUVaQ2lRMEpYM3pBT0QvZEFvOXZETFUrZTU0bmh4ektwZURaeGVcbm1RbjE4Z3RYQWdNQkFBRUNnZ0VBWmw0VVh6TTJSdUZ3MnZaeitJcGdOK1hnc1EyejBObFdXOWZyUzdzS01Sd3FcbjlKTS9TYVJTSFJyWXBaYjYwaytwOE9xTTh4dzcxNHZqMXYwLy9vY0V4cGFCNlBYYUZrUFhvY3BBRFY2ZEF2NkdcbkpzTzB3Z1p3UThnTEZiQWNqWm5mTEhJbHdDUEJ0ZkMxT2FnclNmUEh4d0t2Ymc4cFZMVWgyNzBaZk5uaVQ1KzFcbkVNZDFLYjI1SUEyck85dkxLaEVzZUtIUmkwYU9VaCt5Yk41TGhieVZjQkdJSlQrT2JlS2pNYW5TUzJJSkZ0Q1NcbnB2RUJKcFZ4WTRwK0M3L1NPY0VvamZBZnYvbTVmT0ZOdDdUYStMN2dtcDJENnRjZXNzKzdhbmRZNG1tVElmNEhcbjRIcEhuOWpSSnZtaDB6Tjk2OHc1NmZGMHBWWGlwc2tFQzlxdWxQREJjUUtCZ1FEd1VqcjdqU2JMTFBoT0JhYnBcbjBXMUhMK0Q1WDcrOEVSTGpneDc5blNoYmRNa0VZSlVWSVZ4azM3SHo0cURUcWNNcmtLRCs0MHY3eUdoZTFJQUhcbjBLTU1SVkVOR3lSS0FUaDFYa0lSOVZRNkxYZ2lQZ21sY0J2cGF2MGdBa2swbnBqVHRoYzF1K0Q3L0REV05zVWtcbkV0cmxNdTZQK21yRmtnWFZYRnEzMEZxcGZRS0JnUURtVnpsYzBTSlhGUS8wemFqbWMzeXZ0K2czTFZVcEtjVDZcblAvRWZ6ZmoyN1dZVGFjcXJFT1JkQmdqbGR6LzByNG9WdXZCdUsxd0tNZnRBSWJnQ2F1aE9mektISHFYTm84R1VcbnRwTUtNUzhqckpYNmU0UTJzQzQ0WFAyRllNdjFLNTlTS1FydDYvSEJEUWlnSWowREVZakoxeVNBb0o0Qy9ac2lcbnpjYlMvL1NBWXdLQmdBMjlkZGZhQ3lURXJuR3Zpd3FGU2MwdkpKcTlhYlh6OS9PQUZLNkZaTUJOM2d4ZEJVa09cbi9qeGFPYzlxM3EwYllLaEYvWjUxR213TDJrUEp2SVExM295ZURmTkU0UDlHTUpjdFMzUEJaZzVwZVJ2a0ZpTWFcblZNNDBxc0pBdnpTOStKanFLVXVPTVYvVzNHZnkrN1NEUzNhZFFkeURnY1ZJQXdOZTQyVHRDYkgxQW9HQkFNM0lcbm8xRE83blVLTmlVcEQzcEROdVB0MDZKbjk2czh5K1FlK0JiSDkyTHptTHhEU1hNbk5qMzlSRGx0SGxCRis0R0tcbmIzNmRjaThSbER3cFk3R1ZQVkhUeFpwOXdQZEZFNDcreGNMWFNodis5a2EvenREaytZWVZYZEdwTnM0a1dNUVlcbk10RjRkNVZYUlp0NnV6TmdtT3BxTVF4UmNwbU5aT25sR1hvc2ZZMnRBb0dCQU1YcVhQVlB1K1AzU20vWkpYckdcbnFoMGNrVGk5cDBDQkVzTlRhU3p4Q3R2UU1TeGhOelgxNy8wenBvYlh3L0lEVjNxVE9VaERpaFJXUmZsNkE4bE1cbnVnU0ZwRjdLb2RZZzJIWXpBbGRzTkJCYzNMeUZzaU1KOUxYNW85TDJJWU9MVFlwY3FIejZqbHUrOHdIMnFEbDBcbnFiU0lEa0RaTzdVZlB6TGx3KzFlNStvT1xuLS0tLS1FTkQgUFJJVkFURSBLRVktLS0tLVxuIiwKICAgICJjbGllbnRfZW1haWwiOiAiZGVtb2FjY291bnRAc3Rva2VkLWdlbml1cy0zMDIxMTMuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLAogICAgImNsaWVudF9pZCI6ICIxMTExMzQ0NzY4NzY1OTAwODE2NjMiLAogICAgImF1dGhfdXJpIjogImh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbS9vL29hdXRoMi9hdXRoIiwKICAgICJ0b2tlbl91cmkiOiAiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW4iLAogICAgImF1dGhfcHJvdmlkZXJfeDUwOV9jZXJ0X3VybCI6ICJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9vYXV0aDIvdjEvY2VydHMiLAogICAgImNsaWVudF94NTA5X2NlcnRfdXJsIjogImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL3JvYm90L3YxL21ldGFkYXRhL3g1MDkvZGVtb2FjY291bnQlNDBzdG9rZWQtZ2VuaXVzLTMwMjExMy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIKfQ=="
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