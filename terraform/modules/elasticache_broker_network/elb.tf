resource "aws_elb" "elasticache_elb" {
  name = "${var.stack_description}-elasticache-broker"
  subnets = ["${var.elb_subnets}"]
  security_groups = ["${var.elb_security_groups}"]
  internal = true

  listener {
    lb_port = 80
    lb_protocol = "HTTP"
    instance_port = 80
    instance_protocol = "HTTP"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 3
    interval = 10
    timeout = 5
    target = "HTTP:80/healthcheck"
  }

  tags {
    Name = "${var.stack_description}-elasticache-broker"
  }

   access_logs = {
      bucket        = "cloud-gov-elb-logs"
      bucket_prefix        = "${var.stack_description}"
    }
}
