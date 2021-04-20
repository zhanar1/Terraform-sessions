variable "env" {
    type = string 
    description = "this is an enviroment name"
}

variable "project_name" {
    type = string 
    description = "this is a project name"
}

variable "vpc_cidr_block" {
    type = string 
    description = "this is a cidr block for the vpc"
}

variable "open_cidr_block" { 
  type = string 
    description = "this is an open cidr block"
}

variable "public-subnet-1" { 
  type = string 
    description = "this is a public-subnet-1"
}

variable "public-subnet-2" { 
  type = string 
    description = "this is a public-subnet-2"
}

variable "public-subnet-3" { 
  type = string 
    description = "this is a public-subnet-3"
}

variable "private-subnet-1" { 
  type = string 
    description = "this is a private-subnet-1"
}

variable "private-subnet-2" { 
  type = string 
    description = "this is a private-subnet-2"
}

variable "private-subnet-3" { 
  type = string 
    description = "this is a private-subnet-3"
}

variable "key_name" {
  type        = string
  description = "this is a key name for EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "this is instance type of EC2"
}