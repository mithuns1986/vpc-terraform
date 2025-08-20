output "public_subnet_ids_a" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_subnet_ids_b" {
  value = [for s in aws_subnet.private : s.id]
}
