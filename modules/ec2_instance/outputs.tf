output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.app_server.private_ip
}