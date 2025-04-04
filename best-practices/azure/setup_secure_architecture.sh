#!/bin/bash

# This script sets up a secure Azure reference architecture using Terraform.
# Reference: https://www.hashicorp.com/en/blog/building-a-secure-azure-reference-architecture-with-terraform

# Ensure Azure CLI is installed and logged in
if ! command -v az &> /dev/null; then
    echo "❌ Azure CLI is not installed. Please install it first."
    exit 1
fi

echo "ℹ️ Ensure you are logged into Azure CLI before proceeding."
read -p "Press Enter to continue..."

# Initialize Terraform
terraform init || { echo "❌ Terraform initialization failed"; exit 1; }

# Validate Terraform configuration
terraform validate || { echo "❌ Terraform validation failed"; exit 1; }

# Plan the deployment
terraform plan -out=tfplan || { echo "❌ Terraform plan failed"; exit 1; }

# Apply the deployment
terraform apply tfplan || { echo "❌ Terraform apply failed"; exit 1; }

echo "✅ Secure Azure reference architecture deployed successfully!"
