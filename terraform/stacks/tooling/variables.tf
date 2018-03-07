variable "stack_description" {
  default = "tooling"
}

variable "aws_default_region" {
  default = "us-gov-west-1"
}

variable "vpc_cidr" {}

variable "az1" {
  default = "us-gov-west-1a"
}

variable "az2" {
  default = "us-gov-west-1b"
}
variable "public_cidr_1" {}

variable "public_cidr_2" {}

variable "private_cidr_1" {}

variable "private_cidr_2" {}

variable "rds_private_cidr_1" {}

variable "rds_private_cidr_2" {}

variable "rds_password" {}

variable "rds_multi_az" {
  default = "true"
}

variable "remote_state_bucket" {}

variable "concourse_prod_rds_password" {}
variable "concourse_prod_cidr" {}
variable "concourse_prod_elb_cert_name" {
  default = "star-fr-cloud-gov-2017-05"
}

variable "concourse_staging_rds_password" {}
variable "concourse_staging_cidr" {}
variable "concourse_staging_elb_cert_name" {
  default = "star-fr-stage-cloud-gov-2017-05"
}

variable "monitoring_production_cidr" {}
variable "monitoring_production_elb_cert_name" {
  default = "star-fr-cloud-gov-2017-05"
}

variable "monitoring_staging_cidr" {}
variable "monitoring_staging_elb_cert_name" {
  default = "star-fr-stage-cloud-gov-2017-05"
}

variable "nessus_elb_cert_name" {
  default = "star-fr-cloud-gov-2017-05"
}

variable "bosh_uaa_elb_cert_name" {
  default = "star-fr-cloud-gov-2017-05"
}

variable "restricted_ingress_web_cidrs" {
  type = "list"
}

variable "blobstore_bucket_name" {}

variable "bucket_prefix" {
  default = ""
}

variable "dns_eip_count_production" {
  default = 4
}

variable "dns_eip_count_staging" {
  default = 2
}
