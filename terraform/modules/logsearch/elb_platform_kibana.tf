resource "aws_lb_target_group" "platform_kibana" {
  name     = "${var.stack_description}-platform-kibana"
  port     = 5600
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 30
    matcher             = 403
  }
}

resource "aws_lb_listener_rule" "platform_kibana" {
  count = length(var.hosts)

  listener_arn = var.listener_arn
  priority     = 200 + count.index

  action {
    target_group_arn = aws_lb_target_group.platform_kibana.arn
    type             = "forward"
  }

  condition {
    host_header {
      # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
      # force an interpolation expression to be interpreted as a list by wrapping it
      # in an extra set of list brackets. That form was supported for compatibility in
      # v0.11, but is no longer supported in Terraform v0.12.
      #
      # If the expression in the following list itself returns a list, remove the
      # brackets to avoid interpretation as a list of lists. If the expression
      # returns a single list item then leave it as-is and remove this TODO comment.
      values = [element(var.hosts, count.index)]
    }
  }
}

