variable "concourse_password" {}

variable "default_region" {
  default = "us-gov-west-1"
}

variable "concourse_username" {
  default = "ci"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ami_id" {
  default = "ami-92338cf3"
}

variable "instance_type" {
  default = "t2.micro"
}
