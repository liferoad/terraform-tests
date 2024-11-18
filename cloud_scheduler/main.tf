resource "google_data_pipeline_pipeline" "dataflow_pipeline" {

  name = var.dataflow_pipeline_name

  display_name = var.dataflow_display_name

  type = var.pipeline_type

  state = var.pipeline_state

  region = var.pipeline_region

  project = var.dataflow_project_id

  workload {

    dataflow_flex_template_request {

      project_id = var.dataflow_project_id

      location = var.workload_location


      launch_parameter {

        job_name = var.dataflow_job_name

        parameters = var.dataflow_parameters

        container_spec_gcs_path = var.container_spec_gcs_path

        update = var.update

        environment {

          num_workers = var.worker_number

          temp_location = var.temp_dataflow_loc

          enable_streaming_engine = var.dataflow_streaming_engine_enable

        }

      }

    }
  }
  schedule_info {
    schedule = var.schedule_time
  }

}


resource "google_cloud_scheduler_job" "dataflow_job_scheduler" {

  count = length(var.schedule_time) > 0 ? 1 : 0

  provider = google-beta

  name = "${var.dataflow_pipeline_name}-schdlr"

  description = "scheduler corresponding to dataflow job"

  schedule = var.schedule_time #"0 4 * * *"

  time_zone = var.time_zone

  attempt_deadline = "320s"

  region = var.pipeline_region

  project = var.dataflow_project_id

  retry_config {

    retry_count = 3

    min_backoff_duration = "600s"

  }

  http_target {
    http_method = "POST"
    uri         = "https://datapipelines.googleapis.com/v1/projects/${var.dataflow_project_id}/locations/${var.pipeline_region}/pipelines/${google_data_pipeline_pipeline.dataflow_pipeline.name}:run"

    oauth_token {

      service_account_email = var.scheduler_service_account_email

    }
  }

  depends_on = [google_data_pipeline_pipeline.dataflow_pipeline]

}