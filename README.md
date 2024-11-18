# Terraform Tests

This directory contains tests for various Terraform configurations.  Each subdirectory represents a separate test case.

## Prerequisites

* **Google Cloud Project:** You must have a Google Cloud project with the Data Pipeline API enabled.
* **Terraform:** Ensure Terraform is installed on your local machine.
* **Google Cloud SDK:** The Google Cloud SDK is required to authenticate with your Google Cloud project.
* **Cloud Storage Bucket:**  A Cloud Storage bucket is needed to store the input text file, temporary files, and the output word counts.  The example uses `gs://dataflow-samples/shakespeare/kinglear.txt` as input and requires a bucket named `tmp_xqhu` for output and temporary files.

## Run

cd each of the  directories and run the commands below:

```bash
terraform init
terraform apply
terraform destroy
```
