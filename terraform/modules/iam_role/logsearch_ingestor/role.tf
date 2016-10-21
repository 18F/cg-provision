module "logsearch_ingestor" {
  source = ".."

  role_name = "${var.role_name}"
  iam_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:${var.aws_partition}:s3:::logsearch-*/*"
            ]
        }
    ]
}
EOF
}
