
# S3 backend common TF bucket
resource "aws_s3_bucket" "tf_bucket" {
  force_destroy = true
  bucket        = var.bucket_name

  # We explicitly prevent destruction using terraform. Remove this only if you really know what you're doing!
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_acl" "tf_bucket" {
  bucket = aws_s3_bucket.tf_bucket.id
  acl    = "private"
}


resource "aws_s3_bucket_versioning" "tf_bucket" {
  bucket = aws_s3_bucket.tf_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_bucket" {
  bucket = aws_s3_bucket.tf_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_bucket" {
  bucket                  = aws_s3_bucket.tf_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
