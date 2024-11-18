resource "google_dataflow_job" "wordcount" {
  name = "wordcount-job"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = var.temp_gcs_location
  project = var.project_id
  region = var.region
  parameters = {
    inputFile = var.input_file
    output    = var.output_location
  }
  on_delete = "cancel"
}
