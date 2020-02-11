variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "platform" {
  type    = string
  default = "aws"
}

variable "organization" {
  type    = string
  default = "altobyte"
}

variable "project" {
  type = string
}

variable "component" {
  type = string
}

variable "environment" {
  type = string
}



variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "database_subnet_cidrs" {
  type = list(string)
}

variable "access_cidrs" {
  type = list(string)
  default = [
    "81.2.115.116/32"
  ]
}

variable "vpc_cidr" {
  type    = string
  default = "172.16.0.0/16"
}