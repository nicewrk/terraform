// Resources.
resource "aws_s3_bucket" "nicewrk_service" {
  bucket = "nicewrk-service"

  lifecycle {
    prevent_destroy = true
  }
}

// Outputs.
output "s3_bucket_arn" {
  value = "${aws_s3_bucket.nicewrk_service.arn}"
}
