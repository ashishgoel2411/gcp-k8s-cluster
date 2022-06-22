variable "project" {
  default = "chaos-engineering-354117"
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
  default     = "ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAiY2hhb3MtZW5naW5lZXJpbmctMzU0MTE3IiwKICAicHJpdmF0ZV9rZXlfaWQiOiAiMjZhOTg1YzgxMzM2MGZiMWU0ODlhZGU3OGZiZGY2YmFjYmYyZjRjNCIsCiAgInByaXZhdGVfa2V5IjogIi0tLS0tQkVHSU4gUFJJVkFURSBLRVktLS0tLVxuTUlJRXZRSUJBREFOQmdrcWhraUc5dzBCQVFFRkFBU0NCS2N3Z2dTakFnRUFBb0lCQVFDWjZPZWlMb1p5ZUJ5d1xuRW5mZUxGQmg4eEpiY2VnRGphY1RhZElUUndtZEVtV0YzU2VQaFBMZm9CaVE0cmcyNCtJd0hMSGxxbGJJY0lEdlxuVmdWaUpoWEFvdDlHQithV0V4aTk1Z3VHVDVEL3l3cERLayt1d08vcG5FRWxETUEyWnhKajdQeWNsaGZMNU1STVxuWE1TNklxU050a09ZMnZsU3k2a3RQYldnVGdUYkpUMTJGanhPRVQxaTUvelB3bXpOaDhWekxtRnMzTHNKVUphdVxucUdRejMzQ2tOK0ZQeTYxRUtOSk85ZW51NWtHUlJRS1NnWlgycVZLcmNTRW1UQWFCRDkwUlRyN0xHcnBhMHJWTFxuaTF4T0pjZUFxcFJHcFZ1WDVwazdqMmxvbm1YU0F6YjErdzdseldEeWl5QUU0WDF5REZpMzQxME13N2w4NC9wWlxuYVljS3Ywc05BZ01CQUFFQ2dnRUFDbGdqeDF2NnA5Tm9WREl0a2Nabk1hb2hZL21FSjBiOFFYc0Zoa3VxT3Y4YlxuU1RPN3ZyTG9FdjBpNFl3SFp4TUtad0xxdHYycm53V211TTlPaGRINitNdEpsOTZja2g0ZTlkWnlGRmtoTFB3RFxueU05ZGN5aWZCMU83OGlaSS9lOFFCcHpOUHFYODIvU1lkK3h0UVhobUdHczFZRjdwVG5ZSFBSWHVjT09GZ29nRFxueW1LTE1lbEk3MnFJRVFObE5EYUt3RVVxc05SN0hDTEZGdmgzWDJ2UmQ4dFBUanQxOHlDQ1I1WTFMTlVnaWU5WlxuN0tld3JwdDNJRU4wcTR2U3pFNjNLMTFqODVieGp0MmZ5a21lRG1la3p2VXAydVNWcGxMNU1GYlhBdG4rVlM0YlxucUFqTEJmWk9qbCtTNkVFR1pNZ2UyTTExMUtMTzl6UDFDT3F0ZTVOaEtRS0JnUURINWhrQ2hoWmJvdXdUQnFRVVxuaW4yZnk0RWE3bkhMUEVsbzVUeHoya3dPUzBHSFhoQUJRa3c0WGY0a0VraVlwRDQxMG45L0V5S2diOGtSSGt0TFxuVUMwc3RXTTBFQS9oSzZmM3pyQXRkSmF6UVJpZll0NkxHQVZZL0hiMzBnbGNsdG5nZlZyQXpMamI0UHMvNHZhaFxuNDdlYWRDYzdzd05BWVFwamdFL1dFZkJtMVFLQmdRREZHcTk0NXE2OWdFSW1zUnBoU3dmL3IySGxycUhOKzd2VVxuTW1HbGVGTDY2d2RKaWFmSTI3azJWWXN0UFI2YXdYa0REOXRycm9jTHdJNDMwRXZORWNwL2lNeVBneGdtS05YK1xuVnRaUFlYVnZxZXBIaUNRUVpHbFdCZUFtU0tpaitrS3NNLzJSZkpxNjd6d3lZWWhkeExySzk5UDYvSVZSQlQ4QlxuKzczVFRqamZXUUtCZ1FDOW5lQmZhbjNPMHM2SWhhWWk3Zk9ZSGx3TEJkL2ZYd0pyZy9kQ0ZmSkxKTXUxOGwzUVxuTStsRkZyTzUxN1lSUk1yV0Z5UmxqK3Nxc0o3VHBCN2NBK08ySXlGRkEyOXNzaEtVbC9TNlNYdWg4YisvZ1BPRVxua1hhUklIcGhQVlV3Qk5BTGlCME1BYVhndkpyWDBSME9GNG5UOHhZOEpPU1NydnBCeERiMjR2RmRPUUtCZ0FtcVxuaTF4MGc3Rkxidk1TMEdaaEZaMVdib2lqRGRCYVBoWGorcUh3eXJEL2diWDdpRHp6ZVp2T2lpckh5bzV3V296cFxuNUNyZHZrVzNSY0k2OXR5eHVLcVVmT08wM0NSUzhGdXV5b2ZPRWNKT0pPMHBJZ3Vqd1A2MC93OGhsUk9sbkV0eFxucVVmUFFvOVVXREZvVXhXMkppcjZDRzFRb1FFZUxyN2NKNjBMTXdMUkFvR0FDS0M5M0VGTUQ1Rm9KMGprR0VJS1xuWmNydUt3b1R5NnZwRjFuREh6SEJLYlY0bDJjQS9WcHk3aXdUbGFwQkY3L29hRGd4REppMHZibllKbWtPUnhMRlxuNEdXZENkdjBFeHg5MXdGUGpGalV6M1F1aUYyeGFoRjBXTlFwN1k3RmxyR1JJdHRHZEF0eXp5TnBySENYUm1heFxubUZySWhPeUszd0UwbXN0YU92OVN3bFk9XG4tLS0tLUVORCBQUklWQVRFIEtFWS0tLS0tXG4iLAogICJjbGllbnRfZW1haWwiOiAiZGVtb2FjY291bnQtMTg4QGNoYW9zLWVuZ2luZWVyaW5nLTM1NDExNy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsCiAgImNsaWVudF9pZCI6ICIxMTEyMDM2MDU0ODAxNjgzMjU5OTYiLAogICJhdXRoX3VyaSI6ICJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20vby9vYXV0aDIvYXV0aCIsCiAgInRva2VuX3VyaSI6ICJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS90b2tlbiIsCiAgImF1dGhfcHJvdmlkZXJfeDUwOV9jZXJ0X3VybCI6ICJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9vYXV0aDIvdjEvY2VydHMiLAogICJjbGllbnRfeDUwOV9jZXJ0X3VybCI6ICJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9yb2JvdC92MS9tZXRhZGF0YS94NTA5L2RlbW9hY2NvdW50LTE4OCU0MGNoYW9zLWVuZ2luZWVyaW5nLTM1NDExNy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIKfQo="
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
  default     = "36303acd-4696-4df7-b03a-cd4696ddf70d"
  description = "Gremlin team Secret"
}
