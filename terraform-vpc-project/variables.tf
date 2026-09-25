variable "aws_region" {
  default = "ap-south-2"
  type    = string
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}
variable "public_subnet_1" {
  default = "10.0.1.0/24"
  type    = string
}
variable "public_subnet_2" {
  default = "10.0.2.0/24"
  type    = string
}
