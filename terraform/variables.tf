variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "my_ip" {
  type = string
}

variable "ami_id" {
  type    = string
  default = "ami-01a00762f46d584a1"
}