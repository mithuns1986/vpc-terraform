variable "name" { type = string }
variable "vpc_cidr" { type = string }
variable "enable_dns_support" { default = true }
variable "enable_dns_hostnames" { default = true }
variable "tags" { type = map(string) }
