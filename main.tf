provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Artifact Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.artifact_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.artifact_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "artifacts" {
  for_each = toset(var.artifact_files)

  bucket = aws_s3_bucket.artifact_bucket.bucket
  key    = each.value
  source = "artifacts/${each.value}"
  etag   = filemd5("artifacts/${each.value}")
}
