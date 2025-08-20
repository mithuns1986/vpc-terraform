variable "vpc_id" { type = string }
variable "igw_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "create_public_rt" { type = bool }
variable "create_private_rt" { type = bool }
variable "tags" { type = map(string) }
