
variable "stack_description" {}

variable "concourse_cidr" {
  default = "10.0.30.0/24"
}

variable "concourse_az" {
  default = "us-gov-west-1a"
}

variable "rds_db_name" {
  default = "atc"
}

variable "rds_db_size" {
  default = 10
}

variable "rds_db_storage_type" {
  default = "gp2"
}

variable "rds_instance_type" {
    default = "db.m3.xlarge"
}

variable "rds_username" {
  default = "atc"
}

variable "rds_encrypted" {
  default = true
}

variable "rds_password" {}

variable "rds_subnet_group" {}

variable "rds_security_groups" {}

variable "route_table_id" {}

variable "vpc_id" {}

variable "account_id" {}

variable "elb_cert_name" {}

variable "elb_subnets" {}

variable "elb_security_groups" {}

variable "aws_partition" {}
