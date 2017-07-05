module "varz" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.varz_bucket}"
    aws_partition = "${var.aws_partition}"
    versioning = "true"
}

module "varz_staging" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.varz_staging_bucket}"
    aws_partition = "${var.aws_partition}"
    versioning = "true"
}

module "concourse_credentials" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.concourse_credentials_bucket}"
    aws_partition = "${var.aws_partition}"
    versioning = "true"
}

module "tooling_blobstore" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.tooling_blobstore_bucket}"
    aws_partition = "${var.aws_partition}"
}

module "development_blobstore" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.development_blobstore_bucket}"
    aws_partition = "${var.aws_partition}"
}

module "staging_blobstore" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.staging_blobstore_bucket}"
    aws_partition = "${var.aws_partition}"
}

module "production_blobstore" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.production_blobstore_bucket}"
    aws_partition = "${var.aws_partition}"
}

module "bosh_release" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.bosh_release_bucket}"
    aws_partition = "${var.aws_partition}"
    versioning = "true"
}

module "tmp" {
    source = "../s3_bucket/encrypted_bucket"
    bucket = "${var.tmp_bucket}"
    aws_partition = "${var.aws_partition}"
    versioning = "true"
    expiration_days = 1
}
