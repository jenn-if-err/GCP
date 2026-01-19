# GCP Compute Instance Provisioning

Terraform module for spinning up multiple GCP compute instances. Built this to test quota limits and demonstrate IaC practices.

## What it does

Provisions N number of e2-micro instances in GCP using Terraform. Uses count meta-argument for dynamic instance creation, all named with `quota-vm-{index}` pattern.

## Stack

- Terraform
- GCP Compute Engine (e2-micro instances)
- Debian 11
- Region: asia-northeast1-c

## Structure

```
quotas/
├── main.tf              # Main config
├── variables.tf         # Variable declarations
└── terraform.tfvars     # Your values
```

## Setup

**Prerequisites:**
- Terraform installed
- GCP project with service account
- Service account key JSON at `~/terraform-key.json`

**Usage:**

```bash
# Update terraform.tfvars with your project_id
# Adjust instance_count as needed

terraform init
terraform plan
terraform apply
```
