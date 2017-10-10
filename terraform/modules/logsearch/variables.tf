variable "aws_partition" {}
variable "account_id" {}
variable "stack_description" {}
variable "vpc_id" {}
variable "public_elb_subnets" {type = "list"}
variable "private_elb_subnets" {type = "list"}
variable "bosh_security_group" {}
variable "restricted_security_group" {}
variable "elb_cert_name" {}
