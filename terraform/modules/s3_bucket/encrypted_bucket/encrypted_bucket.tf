resource "aws_s3_bucket" "encrypted_bucket" {
    bucket = "${var.bucket}"
    acl = "${var.acl}"
    versioning {
        enabled = "${var.versioning}"
    }

/* TODO: Enable after https://github.com/cloudfoundry/cloud_controller_ng/pull/658 is released
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Sid": "DenyUnencryptedPut",
        "Effect": "Deny",
        "Principal": {
            "AWS": "*"
        },
        "Action": "s3:PutObject",
        "Resource": "arn:${var.aws_partition}:s3:::${var.bucket}/*",
        "Condition": {
            "StringNotEquals": {
                "s3:x-amz-server-side-encryption": "AES256"
            }
        }
    }]
}
EOF
*/
}
