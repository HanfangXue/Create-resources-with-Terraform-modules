terraform {
  backend "s3" {
    bucket  = "distinctioncoding-tfstatefilebucket"
    key     = "dev/brandon/terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}

# SECURITY GROUPS
module "security_group" {
  source      = "./modules/security_group"
  vpc_id      = var.vpc_id
  my_ip       = var.my_ip
  project_tag = var.project_tag
}

# EC2 INSTANCE
module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.private_subnet_id
  sg_id         = module.security_group.ec2_sg_id
  user_data     = file("user-data.sh")
  project_tag   = var.project_tag
}

# ALB
module "alb" {
  source             = "./modules/alb"
  vpc_id             = var.vpc_id
  alb_subnets        = var.public_subnet_ids
  alb_sg_id          = module.security_group.alb_sg_id
  target_instance_id = module.ec2_instance.instance_id
  project_tag        = var.project_tag
}

# NAT Gateway
module "nat_gateway" {
  source                   = "./modules/nat_gateway"
  vpc_id                   = var.vpc_id
  public_subnet_ids        = var.public_subnet_ids
  private_subnet_id        = var.private_subnet_id
  private_route_table_name = var.private_route_table_name
}