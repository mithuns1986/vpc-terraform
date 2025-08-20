# Creates a foundational VPC network stack with:

## VPC

## Public & Private Subnets

## Internet Gateway

## Route Tables & Associations

## Prerequisites

## Terraform >= 1.5

## AWS credentials configured (env vars or profile)

Usage

# From terraform-network/ (this folder)
terraform init

# Choose an environment
terraform plan -var-file=envs/dev.tfvars
terraform apply -var-file=envs/dev.tfvars

# For QA
terraform apply -var-file=envs/qa.tfvars

# For Prod
terraform apply -var-file=envs/prod.tfvars

Inputs

See variables.tf and each module’s variables.tf. Typical values are supplied in envs/*.tfvars.
