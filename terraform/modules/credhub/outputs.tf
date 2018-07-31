/* RDS credhub Instance */
output "credhub_rds_identifier" {
  value = "${module.rds_identifier}"
}

output "credhub_rds_name" {
  value = "${module.rds_name}"
}

output "credhub_rds_host" {
  value = "${module.rds_host}"
}

output "credhub_rds_port" {
  value = "${module.rds_port}"
}

output "credhub_rds_url" {
  value = "${module.rds_url}"
}

output "credhub_rds_username" {
  value = "${module.rds_username}"
}

output "credhub_rds_password" {
  value = "${module.rds_password}"
}
