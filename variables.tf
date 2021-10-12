variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  default = "us-east-2"
}

# Boot info
variable "user_data" {
    default = "./Scripts/cloud-init"
}     


variable "vpc_cidr" {}
variable "snet_web_cidr" {}

# SSH
# AWS Key pair 
variable "ssh_key_name" {
    default =  "web_Tf"
}
# Local path to file
variable "private_key_path" {
    default = "web_Tf.pem"
}


