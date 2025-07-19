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