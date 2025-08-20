variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "azs" { type = list(string) }
variable "public_subnet_cidrs" { type = list(string), default = [] }
variable "private_subnet_cidrs" { type = list(string), default = [] }
variable "map_public_ip_on_launch" { type = bool, default = true }
variable "tags" { type = map(string), default = {} }
