
variable "account_id" {}

variable "rds_password" {}

variable "concourse_prod_rds_password" {}
variable "concourse_prod_cidr" {
    default = "10.99.30.0/24"
}
variable "concourse_prod_az" {
    default ="us-gov-west-1a"
}
variable "concourse_prod_elb_cert_name" {
    default = "cloud-gov"
}

variable "concourse_staging_rds_password" {}
variable "concourse_staging_cidr" {
    default = "10.99.31.0/24"
}
variable "concourse_staging_az" {
    default = "us-gov-west-1b"
}
variable "concourse_staging_elb_cert_name" {
    default = "cloud-gov"
}