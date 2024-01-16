provider "aws" {
  region = var.region
  profile = "default"
}

locals {
  prefix = "${var.business_division}-${var.environment}"
  vpc_name = "${local.prefix}-vpc"
  security_group_name = "${local.prefix}-sg"
  eks_cluster_name = "${local.prefix}-eks"
  common_tag = {
    Owner = var.owner
    Environment = var.environment
  }
}


# Create VPC terraform module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.0"

  name = local.vpc_name
  cidr = var.vpc_cidr_block

  azs             = data.aws_availability_zones.available_zones.names
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # Database subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets = var.vpc_database_subnets

  # NAT Gateway - Outbound
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support = var.vpc_enable_dns_support

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = local.common_tag

  vpc_tags = {
    Name = local.vpc_name
  }
}

