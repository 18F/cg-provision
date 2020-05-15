resource "aws_route53_zone" "zone" {
  name    = "${var.hosted_zone}"
  comment = "Hosts TXT and CNAME records for the external-domain-broker"
}

data "aws_route53_zone" "cloud_gov" {
  name = "cloud.gov"
}

resource "aws_route53_record" "record" {
  name    = "${aws_route53_zone.zone.name}"
  zone_id = "${data.aws_route53_zone.cloud_gov.zone_id}"
  type    = "NS"
  ttl     = "60"

  records = [
    "${aws_route53_zone.zone.name_servers.0}",
    "${aws_route53_zone.zone.name_servers.1}",
    "${aws_route53_zone.zone.name_servers.2}",
    "${aws_route53_zone.zone.name_servers.3}",
  ]
}

data "template_file" "policy" {
  template = "${file("${path.module}/policy.json")}"

  vars {
    aws_partition     = "${var.aws_partition}"
    account_id        = "${var.account_id}"
    cloudfront_prefix = "${var.cloudfront_prefix}"
    hosted_zone       = "${aws_route53_zone.zone.zone_id}"
  }
}

resource "aws_iam_user" "iam_user" {
  name = "${var.username}"
}

resource "aws_iam_access_key" "iam_access_key_v3" {
  user = "${aws_iam_user.iam_user.name}"
}

resource "aws_iam_user_policy" "iam_policy" {
  name   = "${aws_iam_user.iam_user.name}-policy"
  user   = "${aws_iam_user.iam_user.name}"
  policy = "${data.template_file.policy.rendered}"
}
