# Public RT (default route -> IGW)
resource "aws_route_table" "public" {
  count  = var.create_public_rt && length(var.public_subnet_ids) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(var.tags, { Name = "public-rt" })
}

resource "aws_route" "public_inet" {
  count                  = length(aws_route_table.public) == 1 ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_assoc" {
  for_each       = { for idx, id in var.public_subnet_ids : idx => id }
  subnet_id      = each.value
  route_table_id = aws_route_table.public[0].id
  depends_on     = [aws_route.public_inet]
}

# Private RT (no default route by default)
resource "aws_route_table" "private" {
  count  = var.create_private_rt && length(var.private_subnet_ids) > 0 ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(var.tags, { Name = "private-rt" })
}

resource "aws_route_table_association" "private_assoc" {
  for_each = length(aws_route_table.private) == 1 ? { for idx, id in var.private_subnet_ids : idx => id } : {}

  subnet_id      = each.value
  route_table_id = aws_route_table.private[0].id
}
