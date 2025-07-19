variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address with /32"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to use"
  type        = string
}

variable "private_subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets for ALB and IGW"
  type        = list(string)
}

variable "project_tag" {
  description = "Project tag/name prefix"
  type        = string
  default     = "brandon-alb-app"
}

variable "private_route_table_id" {
  description = "Existing route table ID associated with the private subnet"
  type        = string
}

variable "public_route_table_id" {
  description = "Existing route table ID associated with the public subnet"
  type        = string
}

variable "private_route_table_name" {
  description = "Name tag of private route table to update with NAT route"
  type        = string
}