output "monitoring_subnet" {
  value = "${aws_subnet.monitoring.id}"
}

output "monitoring_az" {
  value = "${var.monitoring_az}"
}

output "monitoring_security_group" {
  value = "${aws_security_group.monitoring.id}"
}

output "monitoring_elb_dns_name" {
  value = "${aws_elb.monitoring_elb.dns_name}"
}

output "monitoring_elb_name" {
  value = "${aws_elb.monitoring_elb.name}"
}

output "prometheus_elb_dns_name" {
  value = "${aws_elb.prometheus_elb.dns_name}"
}

output "prometheus_elb_name" {
  value = "${aws_elb.prometheus_elb.name}"
}
