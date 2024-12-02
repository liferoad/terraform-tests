variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "region" {
  type        = string
  description = "The region for the Data Pipeline and Dataflow job."
  default     = "us-central1"
}

variable "network" {
  type        = string
  description = "The network for the Dataflow job's VMs."
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork for the Dataflow job's VMs."
}

variable "fieldapp_jdbc_connectionurl" {
  type        = string
  description = "JDBC connection URL for the SQL Server database."
  sensitive   = true
}

variable "fieldapp_jdbc_username" {
  type        = string
  description = "Username for the SQL Server database."
  sensitive   = true
}

variable "fieldapp_jdbc_password" {
  type        = string
  description = "Password for the SQL Server database."
  sensitive   = true
}


variable "environment" {
  type        = string
  description = "Environment (e.g., PROD, DEV)."
}

variable "dev_pipeline_schedule" {
  type        = string
  description = "Cron schedule for the pipeline in non-PROD environments."
  default     = "0 * * * *" # Run hourly by default in DEV
}

variable "project" {
  type        = string
  description = "GCP project id used in different places like Bigquery."
}
