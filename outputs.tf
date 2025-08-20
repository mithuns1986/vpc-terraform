output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the created VPC"
}

output "public_subnet_ids" {
  value       = module.subnets.public_subnet_ids
  description = "IDs of public subnets"
}

output "private_subnet_ids" {
  value       = module.subnets.private_subnet_ids
  description = "IDs of private subnets"
}

output "public_route_table_id" {
  value       = module.routes.public_route_table_id
  description = "Public route table ID"
}

output "private_route_table_id" {
  value       = module.routes.private_route_table_id
  description = "Private route table ID (if created)"
}
