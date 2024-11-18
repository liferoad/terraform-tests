variable "dataflow_project_id" {
  type        = string
  description = "The ID of the Google Cloud project where the Dataflow job will run."
}

variable "temp_dataflow_loc" {
  type        = string
  description = "The GCS path for temporary Dataflow files."
}

variable "output_location" {
  type        = string
  description = "The GCS path where the Dataflow output will be written."
}

variable "dataflow_pipeline_name" {
  type        = string
  description = "The name of the Dataflow pipeline."
}

variable "dataflow_display_name" {
  type        = string
  description = "The display name of the Dataflow pipeline."
}

variable "pipeline_type" {
  type        = string
  description = "The type of the pipeline (e.g., PIPELINE_TYPE_BATCH)."
}

variable "pipeline_state" {
  type        = string
  description = "The state of the pipeline (e.g., STATE_ACTIVE)."
}

variable "pipeline_region" {
  type        = string
  description = "The region where the Dataflow pipeline will run."
}

variable "workload_location" {
  type        = string
  description = "The Dataflow workload location"
}

variable "dataflow_job_name" {
  type        = string
  description = "The name of the Dataflow job."
}


variable "dataflow_parameters" {
  type        = map(string)
  description = "Parameters for the Dataflow job."
}

variable "container_spec_gcs_path" {
  type        = string
  description = "The GCS path to the Dataflow template."
}

variable "update" {
  type        = bool
  description = "Whether to update the pipeline if it already exists.  Defaults to false."
  default     = false
}

variable "worker_number" {
  type        = number
  description = "The number of worker VMs to use for the Dataflow job."

}

variable "dataflow_streaming_engine_enable" {
  type        = bool
  description = "Whether to enable Dataflow streaming engine."
}

variable "schedule_time" {
  type        = string
  description = "The cron schedule for the Cloud Scheduler job."
}

variable "time_zone" {
  type        = string
  description = "The time zone for the Cloud Scheduler job. If empty, defaults to UTC."
  default     = "America/New_York"
}

variable "scheduler_service_account_email" {
  type = string
}
