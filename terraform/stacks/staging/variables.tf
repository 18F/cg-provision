variable "stack_description" {
    default = "staging"
}

variable "vpc_cidr" {}

variable "public_cidr_1" {}

variable "public_cidr_2" {}

variable "private_cidr_1" {}

variable "private_cidr_2" {}

variable "rds_private_cidr_1" {}

variable "rds_private_cidr_2" {}

variable "rds_password" {}

variable "account_id" {}

variable "remote_state_bucket" {}

variable "target_stack_name" {
    default = "tooling"
}