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
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Install Terraform
### Install HashiCorp's GPG key.
```sh
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

### Verify the GPG key's fingerprint
```sh
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```
### Add the official HashiCorp repository
```sh
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```
### update
```sh
sudo apt update
```
### install
```sh
sudo apt-get install terraform
```

## Alternative
https://hasangural.com/github-codespaces-terraform

### configure dev container
```json
{
  "image": "mcr.microsoft.com/devcontainers/universal:2",
  "features": {
    "ghcr.io/devcontainers/features/terraform:1": {},
    "ghcr.io/dhoeric/features/google-cloud-cli:1": {}
  }
}
```


## Authentication

Authenticate with GCP using gcloud:
```bash
gcloud auth application-default login
```

## Usage

```bash
# Update terraform.tfvars with your project_id and instance_count

terraform init
terraform plan
terraform apply
```
