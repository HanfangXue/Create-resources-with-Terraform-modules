variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type (e.g., t3.micro)"
  type        = string
}

variable "subnet_id" {
  description = "The private subnet ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The name of the existing SSH key pair"
  type        = string
}

variable "sg_id" {
  description = "The security group ID to attach to the EC2 instance"
  type        = string
}

variable "user_data" {
  description = "User data script to install Docker and run the app"
  type        = string
}

variable "project_tag" {
  description = "Tag prefix to identify the instance"
  type        = string
}