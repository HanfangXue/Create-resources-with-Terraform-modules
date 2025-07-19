variable "vpc_id" {
  description = "The VPC ID where the security groups will be created"
  type        = string
}

variable "my_ip" {
  description = "Your own public IP in CIDR notation (e.g., 203.0.113.45/32)"
  type        = string
}

variable "project_tag" {
  description = "Prefix tag to identify your resources"
  type        = string
}