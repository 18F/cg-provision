/*
 * Variables required:
 *  stack_description
 *  vpc_id
 */

resource "aws_security_group" "monitoring" {
  description = "Allow access to incoming monitoring traffic"
  vpc_id = "${var.vpc_id}"

  tags =  {
    Name = "${var.stack_description} - Incoming Monitoring Traffic"
  }

}

resource "aws_security_group_rule" "self_reference" {
    type = "ingress"
    self = true
    from_port = 0
    to_port = 0
    protocol = -1
    security_group_id = "${aws_security_group.monitoring.id}"
}

resource "aws_security_group_rule" "monitoring_grafana" {
    type = "ingress"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.monitoring.id}"
}

resource "aws_security_group_rule" "monitoring_riemann" {
    type = "ingress"
    from_port = 5555
    to_port = 5559
    protocol = "all"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.monitoring.id}"
}

resource "aws_security_group_rule" "outbound" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.monitoring.id}"
}
