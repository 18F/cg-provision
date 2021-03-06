output "credhub_subnet" {
  value = aws_subnet.credhub.id
}

output "credhub_subnet_cidr" {
  value = aws_subnet.credhub.cidr_block
}

output "credhub_security_group" {
  value = aws_security_group.credhub.id
}

/* RDS credhub Instance */
output "credhub_rds_identifier" {
  value = module.rds_96.rds_identifier
}

output "credhub_rds_name" {
  value = module.rds_96.rds_name
}

output "credhub_rds_host" {
  value = module.rds_96.rds_host
}

output "credhub_rds_port" {
  value = module.rds_96.rds_port
}

output "credhub_rds_url" {
  value = module.rds_96.rds_url
}

output "credhub_rds_username" {
  value = module.rds_96.rds_username
}

output "credhub_rds_password" {
  value = module.rds_96.rds_password
}

output "credhub_lb_target_group" {
  value = aws_lb_target_group.credhub_target.name
}

