variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  default = "us-east-2"
}



variable "vpc_cidr" {}
variable "snet_web_cidr" {}

# AWS Key pair 
variable "ssh_key_name" {}

# Local path to file
variable "private_key_path" {}


