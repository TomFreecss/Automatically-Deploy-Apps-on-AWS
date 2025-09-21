variable "region" { default = "eu-west-1" }
variable "state_bucket" {}
variable "lock_table" {}
variable "github_owner" {}
variable "github_repo" {}
variable "github_branch" { default = "main" }
variable "codestar_connection_arn" { default = "" } # opzionale: se la crei manuale
variable "container_port" { default = 80 }

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "demo-app"
}