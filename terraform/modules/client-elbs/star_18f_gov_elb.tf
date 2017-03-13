resource "aws_elb" "star_18f_gov_elb" {
  count = "${var.count}"

  name = "${var.stack_description}-star-18f-gov-elb"
  subnets = ["${split(",", var.elb_subnets)}"]
  security_groups = ["${split(",", var.elb_security_groups)}"]

  listener {
    lb_port = 80
    lb_protocol = "HTTP"
    instance_port = 80
    instance_protocol = "HTTP"
  }

  listener {
    lb_port = 443
    lb_protocol = "HTTPS"
    instance_port = 80
    instance_protocol = "HTTP"

    ssl_certificate_id = "arn:${var.aws_partition}:iam::${var.account_id}:server-certificate/${var.star_18f_gov_cert_name}"
  }

  listener {
    lb_port = 4443
    lb_protocol = "SSL"
    instance_port = 80
    instance_protocol = "TCP"

    ssl_certificate_id = "arn:${var.aws_partition}:iam::${var.account_id}:server-certificate/${var.star_18f_gov_cert_name}"
  }

  health_check {
    healthy_threshold = 2
    interval = 5
    target = "TCP:80"
    timeout = 4
    unhealthy_threshold = 3
  }

  tags = {
    Name = "${var.stack_description}-star-18f-gov-elb"
  }
}
