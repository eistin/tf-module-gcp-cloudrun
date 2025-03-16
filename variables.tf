variable "project_id" {
  description = "The ID of the project in which resources will be managed."
  type        = string
}

variable "service_account_mail" {
  type        = string
  description = "Service account used for the cloud run container"
}

variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "image" {
  description = "The container image to deploy."
  type        = string
}

variable "location" {
  description = "The location of the cloud run service."
  type        = string
  default     = "europe-west1"
}

variable "port" {
  description = "The port on which the container is listening for incoming HTTP requests."
  type        = number
  default     = 8080
}

variable "timeout" {
  description = ""
  type        = string
  default     = null
}

variable "min_instance_count" {
  type        = number
  description = "Max instance the cloud run can launch"
  default     = 0
}

variable "max_instance_count" {
  type        = number
  description = "Max instance the cloud run can launch"
  default     = 2
}

variable "cloudsql_connections" {
  description = "Map of Cloud SQL connections Cloud SQL"
  type        = map(string)
  default     = {}
}

variable "env_vars" {
  description = "Environment variables to set in the container"
  type        = map(string)
  default     = {}
}

variable "env_secret_vars" {
  description = "Secret environment variables to set in the container"
  type = map(object({
    secret  = string
    version = string
  }))
  default = {}
}

variable "is_public" {
  type        = bool
  description = "Make the cloud run public or not"
  default     = false
}

variable "private_access_iam_members" {
  type = list(object({
    id    = string
    email = string
  }))
  description = "Members to give access to"
  default     = []
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = ""
}

variable "cpu_limit" {
  description = "CPU Limit for the container (example: '1000m')"
  type        = string
  default     = "1000m"
}

variable "memory_limit" {
  description = "Memory limit for the container (exemple: '512Mi')"
  type        = string
  default     = "512Mi"
}

variable "startup_cpu_boost" {
  description = "Activate CPU Boost at startup"
  type        = bool
  default     = false
}

variable "cpu_idle" {
  description = "Allow CPU idle"
  type        = bool
  default     = true
}
