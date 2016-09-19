variable "stack_description" {}

variable "az1" {
  default = "us-gov-west-1a"
}

variable "az2" {
  default = "us-gov-west-1b"
}

variable "private_route_table_az1" {}

variable "private_route_table_az2" {}

variable "vpc_id" {}

variable "elb_subnets" {}

variable "diego_cidr_1" {}

variable "diego_cidr_2" {}
