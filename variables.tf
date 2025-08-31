variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "test-bucket"
}

variable "environment" {
  description = "Deployment environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

variable "artifact_files" {
  description = "List of artifact files to upload"
  type        = list(string)
}
