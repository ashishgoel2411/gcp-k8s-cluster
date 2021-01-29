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

variable "bucket" {
  type        = string
  default     = "k8s-token-bucket1234"
  description = "Bucket to store logs"
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