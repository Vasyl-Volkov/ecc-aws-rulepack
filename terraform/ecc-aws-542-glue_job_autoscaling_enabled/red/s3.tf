resource "aws_s3_object" "this" {
  bucket = aws_s3_bucket.this.id
  key    = "script"
  acl    = "private"
  source = "script.py"
  etag = filemd5("script.py")
}

resource "aws_s3_bucket" "this" {
  bucket        = "542-bucket-${random_integer.this.result}-red"
  force_destroy = true
}

resource "random_integer" "this" {
  min = 1
  max = 10000000
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
