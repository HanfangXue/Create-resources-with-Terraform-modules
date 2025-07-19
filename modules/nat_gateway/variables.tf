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

variable "private_route_table_name" {
  description = "Name tag of private route table to update with NAT route"
  type        = string
}