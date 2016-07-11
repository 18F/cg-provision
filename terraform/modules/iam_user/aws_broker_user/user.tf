
module "aws_broker_user" {
    source = ".."

    username = "${var.username}"

    /* TODO: Make the bucket names configurable */
    /* TODO: Make `subgrp` configurable */
    iam_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "manageRdsInstances",
            "Effect": "Allow",
            "Action": [
                "rds:DescribeDBInstances",
                "rds:CreateDBInstance",
                "rds:DeleteDBInstance"
            ],
            "Resource": [
                "arn:${var.aws_partition}:rds:${var.aws_default_region}:${var.account_id}:db:cg-aws-broker-*",
                "arn:${var.aws_partition}:rds:${var.aws_default_region}:${var.account_id}:subgrp:production",
                "arn:${var.aws_partition}:rds:${var.aws_default_region}:${var.account_id}:subgrp:staging"
            ]
        },
        {
            "Sid": "readTerraformState",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:${var.aws_partition}:s3:::${var.remote_state_bucket}",
                "arn:${var.aws_partition}:s3:::${var.remote_state_bucket}/*"
            ]
        },
        {
            "Sid": "manageTerraformState",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:${var.aws_partition}:s3:::${var.remote_state_bucket}/cg-aws-broker-*",
                "arn:${var.aws_partition}:s3:::${var.remote_state_bucket}/cg-aws-broker-*/*"
            ]
        }
    ]
}
EOF
}
