# SIMPLE MOCK – no provider, no resources. Only outputs, so init/plan/apply need no cloud.

terraform {
  required_version = ">= 1.5"

  # Path comes from envs/<environment>/backend.hcl
  backend "local" {}
}

variable "environment" {
  type = string # from envs/<environment>/terraform.tfvars
}

variable "github_environment" {
  type    = string # from the workflow (the GitHub Environment the job ran in)
  default = "not-set"
}

output "environment" {
  value = var.environment
}

output "github_environment" {
  value = var.github_environment
}

output "message" {
  value = "Terraform ran in the ${upper(var.environment)} environment"
}
