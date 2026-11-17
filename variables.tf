
variable "region" {
  default = "eu-north-1"
}

variable "ami_id" {
  description = "AMI for EC2"
  default     = "ami-07c8c1b18ca66bb07"
}

variable "bucket_name" {
  default = "d7078e-lab4-terraform-2026-ml-cs"
}
