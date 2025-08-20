locals {
  # Pair each subnet CIDR to an AZ by index if possible
  public_pairs  = [for i, cidr in var.public_subnet_cidrs : {
    cidr = cidr
    az   = var.azs[ i % length(var.azs) ]
  }]

  private_pairs = [for i, cidr in var.private_subnet_cidrs : {
    cidr = cidr
    az   = var.azs[ i % length(var.azs) ]
  }]
}

resource "aws_subnet" "public" {
  for_each = { for i, p in local.public_pairs : i => p }

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(var.tags, {
    Name = format("%s-public-%s", var.name_prefix, replace(each.value.az, ".*$", ""))
    Tier = "public"
  })
}

resource "aws_subnet" "private" {
  for_each = { for i, p in local.private_pairs : i => p }

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(var.tags, {
    Name = format("%s-private-%s", var.name_prefix, replace(each.value.az, ".*$", ""))
    Tier = "private"
  })
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids" {
  value = [for s in aws_subnet.private : s.id]
}
