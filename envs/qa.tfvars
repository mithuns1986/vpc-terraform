region       = "ap-south-1"
environment  = "qa"
vpc_cidr     = "10.20.0.0/16"

azs = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnet_cidrs = [
  "10.20.1.0/24",
  "10.20.2.0/24"
]

private_subnet_cidrs = [
  "10.20.11.0/24",
  "10.20.12.0/24"
]

tags = {
  Owner   = "platform"
  CostCtr = "2002"
}
