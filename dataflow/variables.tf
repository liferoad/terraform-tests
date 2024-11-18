variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "temp_gcs_location" {
  type    = string
  default = "gs://tmp_xqhu/tf-test"
}

variable "input_file" {
  type    = string
  default = "gs://dataflow-samples/shakespeare/kinglear.txt"
}

variable "output_location" {
  type    = string
  default = "gs://tmp_xqhu/tf-test/wordcount/output"
}
