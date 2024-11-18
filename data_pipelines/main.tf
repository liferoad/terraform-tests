resource "google_data_pipeline_pipeline" "wordcount" {
  name = "tf-pipeline-xq1"
  display_name = "wordcount"
  type         = "PIPELINE_TYPE_BATCH"
  state        = "STATE_ACTIVE"
  project      = "manav-jit-test"
  region       = "us-central1"

  workload {
      dataflow_launch_template_request {
       project_id = "manav-jit-test"
       location = "us-central1"
       gcs_path = "gs://dataflow-templates-us-central1/latest/Word_Count"
       launch_parameters {
         job_name = "tf-pipeline-xq1"
         parameters = {
           "inputFile": "gs://dataflow-samples/shakespeare/kinglear.txt",
           "output": "gs://tmp_xqhu/tf-test/wordcount/output"
         }
         environment {
           temp_location = "gs://tmp_xqhu/tf-test"
           num_workers                = 1
         }
       }
     }
   }
   schedule_info {
     schedule = "* */2 * * *"
   }
}

