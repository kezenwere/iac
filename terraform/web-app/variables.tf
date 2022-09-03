

variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
  default     = "dev"
}