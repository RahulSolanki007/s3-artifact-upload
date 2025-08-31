bucket_name    = "Test-Bucket-${var.environment}-${var.aws_region}-${random_id.bucket_suffix.hex}"
artifact_files = ["file1.txt", "image.png"]
