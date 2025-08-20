locals {
  common_tags = merge(
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = "network-stack"
    },
    var.tags
  )
}

module "vpc" {
  source               = "./modules/vpc"
  name                 = "${var.environment}-vpc"
  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = local.common_tags
}

module "subnets" {
  source                 = "./modules/subnets"
  name_prefix            = var.environment
  vpc_id                 = module.vpc.vpc_id
  azs                    = var.azs
  public_subnet_cidrs    = var.public_subnet_cidrs
  private_subnet_cidrs   = var.private_subnet_cidrs
  map_public_ip_on_launch = true
  tags                   = local.common_tags
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  tags   = local.common_tags
}

module "routes" {
  source              = "./modules/routes"
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.igw.igw_id
  public_subnet_ids   = module.subnets.public_subnet_ids
  private_subnet_ids  = module.subnets.private_subnet_ids
  create_public_rt    = false
  create_private_rt   = length(module.subnets.private_subnet_ids) > 0
  tags                = local.common_tags
}
