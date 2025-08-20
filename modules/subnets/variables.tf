variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "azs" { type = list(string) }
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "map_public_ip_on_launch" { type = bool }
variable "tags" { type = map(string) }
