// Resources.
resource "aws_iam_user" "nicewrk_service" {
  name = "NicewrkService"
  path = "/system/"
}

data "aws_caller_identity" "current" {}

resource "aws_iam_access_key" "nicewrk_service" {
  user    = "${aws_iam_user.nicewrk_service.name}"
  pgp_key = "${var.pgp_keys[data.aws_caller_identity.current.account_id]}"
}

data "aws_iam_policy_document" "nicewrk_service" {
  policy_id = "nicewrk-service"

  statement {
    actions = [
      "s3:PutObject*",
    ]

    resources = [
      "${aws_s3_bucket.nicewrk_service.arn}/*",
    ]
  }
}

resource "aws_iam_policy" "nicewrk_service" {
  name   = "nicewrk-service"
  policy = "${data.aws_iam_policy_document.nicewrk_service.json}"
}

resource "aws_iam_user_policy_attachment" "nicewrk_service" {
  user       = "${aws_iam_user.nicewrk_service.name}"
  policy_arn = "${aws_iam_policy.nicewrk_service.arn}"
}

// Outputs.
output "nicewrk_service_aws_access_key" {
  value = "${aws_iam_access_key.nicewrk_service.id}"
}

output "nicewrk_service_aws_secret_access_key_encrypted" {
  value = "${aws_iam_access_key.nicewrk_service.encrypted_secret}"
}
