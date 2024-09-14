resource "aws_s3_bucket" "example" {
  bucket = "kandugula1234"

  tags = {
    Name        = "kandugula1234"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.example.id
  acl    = "public-read"
}



resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.example.id
  key = "profile.png"
  source = "profile.png"
  acl = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.example.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}
resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.example.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}
resource "aws_s3_object" "script_js" {
  bucket = aws_s3_bucket.example.id
  key = "script.js"
  source = "script.js"
  acl = "public-read"
  content_type = "application/javascript"
}

resource "aws_s3_object" "styles_css" {
  bucket = aws_s3_bucket.example.id
  key = "styles.css"
  source = "styles.css"
  acl = "public-read"
  content_type = "text/css"
}



resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.example.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.example ]
}
