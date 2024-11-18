dataflow_project_id    = "manav-jit-test"
temp_dataflow_loc      = "gs://tmp_xqhu/tf-test"
output_location        = "gs://tmp_xqhu/tf-test/wordcount/output"
dataflow_pipeline_name = "wordcount-test"
dataflow_display_name  = "wordcount"
pipeline_type          = "PIPELINE_TYPE_BATCH"
pipeline_state         = "STATE_ACTIVE"
pipeline_region        = "us-central1"
workload_location      = "us-central1"
dataflow_job_name      = "tf-pipeline-xq1"
dataflow_parameters = {
  "inputFile" : "gs://dataflow-samples/shakespeare/kinglear.txt",
  "output" : "gs://tmp_xqhu/tf-test/wordcount/output"
}
container_spec_gcs_path          = "gs://dataflow-templates-us-central1/latest/Word_Count"
update                           = false
worker_number                    = 1
dataflow_streaming_engine_enable = false
schedule_time                    = "0 4 * * *"
time_zone                        = "America/New_York"
scheduler_service_account_email  = "test-cs-sq@manav-jit-test.iam.gserviceaccount.com"