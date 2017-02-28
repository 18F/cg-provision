output "elb_main_dns_name" {
  value = "${aws_elb.cloudfoundry_elb_main.dns_name}"
}

output "elb_main_name" {
  value = "${aws_elb.cloudfoundry_elb_main.name}"
}

output "elb_apps_dns_name" {
  value = "${aws_elb.cloudfoundry_elb_apps.dns_name}"
}

output "elb_apps_name" {
  value = "${aws_elb.cloudfoundry_elb_apps.name}"
}

output "cf_rds_url" {
  value = "${module.cf_database.rds_url}"
}

output "cf_rds_96_url" {
  value = "${module.cf_database_96.rds_url}"
}

output "cf_rds_host" {
  value = "${module.cf_database.rds_host}"
}

output "cf_rds_port" {
  value = "${module.cf_database.rds_port}"
}

output "cf_rds_username" {
  value = "${module.cf_database.rds_username}"
}

output "cf_rds_password" {
  value = "${module.cf_database.rds_password}"
}

output "cf_rds_engine" {
  value = "${module.cf_database.rds_engine}"
}

/* Services network */
output "services_subnet_az1" {
  value = "${aws_subnet.az1_services.id}"
}
output "services_subnet_az2" {
  value = "${aws_subnet.az2_services.id}"
}

/* S3 broker user */
output "s3_broker_username" {
  value = "${module.s3_broker_user.username}"
}
output "s3_broker_access_key_id" {
  value = "${module.s3_broker_user.access_key_id}"
}
output "s3_broker_secret_access_key" {
  value = "${module.s3_broker_user.secret_access_key}"
}
