provider "aws" {
  region     = "eu-west-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source         = "./vpc"
  nat_gateway_id = module.subnet.nat_gateway_id
}

module "subnet" {
  source = "./subnet"

  vpc_id                 = module.vpc.vpc_id
  public_route_table_id  = module.vpc.public_route_table_id
  private_route_table_id = module.vpc.private_route_table_id
  web_traffic_sg_id      = module.vpc.web_traffic_sg_id
  net_private_ips        = ["10.0.1.50"]
  internet_gateway       = module.vpc.internet_gateway
}

module "ec2" {
  source            = "./ec2"
  net_id_prod       = module.subnet.network_interface_prod_id
  net_id_test       = module.subnet.network_interface_test_id
  net_id_jenkins    = module.subnet.network_interface_jenkins_id
  ami_id            = "ami-08bac620dc84221eb"
  instance_type     = "t2.medium"
  av_zone           = "eu-west-1a"
  key_name          = "ssh-aws-key"
  subnet_group_name = module.subnet.subnet_group_name
  sql_sg_id         = module.vpc.sql_sg_id
  database_password = var.database_password
}
