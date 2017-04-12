output "concourse_subnet" {
  value = "${aws_subnet.concourse.id}"
}
output "concourse_subnet_cidr" {
  value = "${aws_subnet.concourse.cidr_block}"
}

output "concourse_security_group" {
  value = "${aws_security_group.concourse.id}"
}

/* RDS Concourse Instance */
output "concourse_rds_identifier" {
  value = "${module.rds_96.rds_identifier}"
}

output "concourse_rds_name" {
  value = "${module.rds_96.rds_name}"
}

output "concourse_rds_host" {
  value = "${module.rds_96.rds_host}"
}

output "concourse_rds_port" {
  value = "${module.rds_96.rds_port}"
}

output "concourse_rds_url" {
  value = "${module.rds_96.rds_url}"
}

output "concourse_rds_username" {
  value = "${module.rds_96.rds_username}"
}

output "concourse_rds_password" {
  value = "${module.rds_96.rds_password}"
}

output "concourse_elb_dns_name" {
  value = "${aws_elb.concourse_elb.dns_name}"
}

output "concourse_elb_name" {
  value = "${aws_elb.concourse_elb.name}"
}

output "concourse_elb_zone_id" {
  value = "${aws_elb.concourse_elb.zone_id}"
}
