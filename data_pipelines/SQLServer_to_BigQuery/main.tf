locals {
  test-customer_account_email    = "${var.project_id}-compute@developer.gserviceaccount.com"
  test-customer_staging_location = "gs://dataflow-staging-${var.region}-${var.project_id}/staging"
  test-customer_dataflow_query   = "select * from public.persons"
  test-customer_temp_location    = "gs://dataflow-staging-${var.region}-${var.project_id}/tmp"
  test-customer_output_table     = "${var.project}.stage_gcs_rxr.sql_fa_customer"
  test-customer_bq_load_temp_dir = "gs://${var.project}_recon_scratch/temp_dir"
}

resource "google_data_pipeline_pipeline" "test-customer" {
  project      = var.project
  name         = "test-customer"
  display_name = "test-customer"
  type         = "PIPELINE_TYPE_BATCH"
  state        = "STATE_ACTIVE"
  region       = var.region
  workload {
    dataflow_flex_template_request {
      project_id = var.project
      location   = var.region
      launch_parameter {
        job_name                = "test-customer"
        container_spec_gcs_path = "gs://dataflow-templates-us-east1/latest/flex/SQLServer_to_BigQuery"
        parameters = {
          connectionURL                     = var.fieldapp_jdbc_connectionurl
          connectionProperties              = "trustServerCertificate=true"
          username                          = var.fieldapp_jdbc_username
          password                          = var.fieldapp_jdbc_password
          query                             = local.test-customer_dataflow_query
          outputTable                       = local.test-customer_output_table
          bigQueryLoadingTemporaryDirectory = local.test-customer_bq_load_temp_dir
          stagingLocation                   = local.test-customer_staging_location
          useColumnAlias                    = "false"
          isTruncate                        = "true"
          fetchSize                         = "50000"
          createDisposition                 = "CREATE_NEVER"
          useStorageWriteApi                = "false"
          useStorageWriteApiAtLeastOnce     = "false"
          autoscalingAlgorithm              = "THROUGHPUT_BASED"
        }
        environment {
          num_workers            = 2
          additional_experiments = ["enable_prime"]
          service_account_email  = local.test-customer_account_email
          network                = var.network
          subnetwork             = var.subnetwork
          temp_location          = local.test-customer_temp_location
        }
      }
    }
  }
  schedule_info {
    schedule  = var.environment == "PROD" ? "0 2 * * *" : var.dev_pipeline_schedule
    time_zone = "US/Eastern"
  }
}
