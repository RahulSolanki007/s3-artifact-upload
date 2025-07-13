output "bucket_name" {
  value = aws_s3_bucket.artifact_bucket.bucket
}

output "artifact_urls" {
  value = {
    for file in var.artifact_files :
    file => "https://${aws_s3_bucket.artifact_bucket.bucket}.s3.amazonaws.com/${file}"
  }
}
