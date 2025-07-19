resource "aws_instance" "app_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = var.user_data

  tags = {
    Name = "${var.project_tag}-app-server"
  }
}