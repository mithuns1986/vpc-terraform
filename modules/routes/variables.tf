variable "vpc_id" { type = string }
variable "igw_id" { type = string }
variable "public_subnet_ids" { type = list(string), default = [] }
variable "private_subnet_ids" { type = list(string), default = [] }
variable "create_public_rt" { type = bool, default = true }
variable "create_private_rt" { type = bool, default = true }
variable "tags" { type = map(string), default = {} }
