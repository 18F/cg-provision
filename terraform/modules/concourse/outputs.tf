
output "concourse_subnet" {
  value = "${aws_subnet.concourse.id}"
}

output "concourse_security_group" {
  value = "${aws_security_group.concourse.id}"
}

/* RDS Concourse Instance */
output "concourse_rds_url" {
  value = "${module.rds.rds_url}"
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
