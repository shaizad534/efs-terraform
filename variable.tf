# Variables TF File
variable "region" {
  description = "AWS Region "
  default     = "us-east-1"
}

variable "vpcid" {
  description = "Vpc to be used for efs "
  default     = "vpc-4cbd4d31"
}

variable "subnetid" {
  description = "Subnet ID to be used for Instance "
  default     = "subnet-2069c87f"
}

variable "Env" {
  description = "Environment Name"
  default     = "poc-efs"
}

variable "PvtIp" {
  description = " subnet IP to be allowed for efs access"
  default     = "172.31.32.0/20"
}

variable "creation_token" {
  description = "Token name used by efs"
  default     = "globalid-poc-efs"
}
