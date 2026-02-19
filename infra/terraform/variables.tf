variable "aws_region" {
  type    = string
  default = "ap-south-1" # Mumbai
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "my_ip_cidr" {
  description = "Your IP for SSH access, e.g. 1.2.3.4/32"
  type        = string
}
