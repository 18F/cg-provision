variable "stack_description" {}

variable "elb_subnets" {
  type = "list"
}

variable "elb_security_groups" {
  type = "list"
}

variable "elb_shibboleth_cert_name" {}

variable "account_id" {}

variable "aws_partition" {}
