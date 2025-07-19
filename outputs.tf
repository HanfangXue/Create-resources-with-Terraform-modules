output "alb_dns_name" {
  value = module.alb.dns_name
}

output "app_instance_id" {
  value = module.ec2_instance.instance_id
}

output "app_private_ip" {
  value = module.ec2_instance.private_ip
}