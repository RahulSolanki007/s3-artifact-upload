variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "artifact_files" {
  description = "List of artifact files to upload"
  type        = list(string)
}
