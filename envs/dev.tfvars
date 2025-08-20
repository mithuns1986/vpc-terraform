region       = "ap-south-1"
environment  = "dev"
vpc_cidr     = "10.10.0.0/16"

# Pick AZs available in your region
azs = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnet_cidrs = [
  "10.10.1.0/24",
  "10.10.2.0/24"
]

private_subnet_cidrs = [
  "10.10.11.0/24",
  "10.10.12.0/24"
]

tags = {
  Owner   = "platform"
  CostCtr = "1001"
}
