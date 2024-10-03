variable "project_id" {
  type        = string
  description = "The ID of the GCP project"
}

variable "service_account_mail" {
  type        = string
  description = "Mail's service account"
}

variable "cloudsql_instances_connection_name" {
  type        = string
  description = "Instance connection name of the cloudsql instance you want to connect to"
}
