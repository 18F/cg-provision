
/* VPC */
output "vpc_id" {
    value = "${module.stack.vpc_id}"
}
output "vpc_cidr" {
    value = "${module.stack.vpc_cidr}"
}

/* Private network */
output "private_subnet_az1" {
  value = "${module.stack.private_subnet_az1}"
}
output "private_subnet_az2" {
  value = "${module.stack.private_subnet_az2}"
}
output "private_route_table_az1" {
  value = "${module.stack.private_route_table_az1}"
}
output "private_route_table_az2" {
  value = "${module.stack.private_route_table_az2}"
}

/* Public network */
output "public_subnet_az1" {
  value = "${module.stack.public_subnet_az1}"
}
output "public_subnet_az2" {
  value = "${module.stack.public_subnet_az2}"
}
output "public_route_table" {
  value = "${module.stack.public_route_table}"
}

/* Security Groups */
output "bosh_security_group" {
  value = "${module.stack.bosh_security_group}"
}
output "local_vpc_traffic_security_group" {
    value = "${module.stack.local_vpc_traffic_security_group}"
}
output "web_traffic_security_group" {
  value = "${module.stack.web_traffic_security_group}"
}

/* RDS Network */
output "rds_subnet_az1" {
    value = "${module.stack.rds_subnet_az1}"
}
output "rds_subnet_az2" {
    value = "${module.stack.rds_subnet_az2}"
}
output "rds_subnet_group" {
    value = "${module.stack.rds_subnet_group}"
}
output "rds_mysql_security_group" {
  value = "${module.stack.rds_mysql_security_group}"
}
output "rds_postgres_security_group" {
  value = "${module.stack.rds_postgres_security_group}"
}

/* RDS Bosh Instance */
output "bosh_rds_url" {
  value = "${module.stack.bosh_rds_url}"
}
output "bosh_rds_host" {
  value = "${module.stack.bosh_rds_host}"
}
output "bosh_rds_port" {
  value = "${module.stack.bosh_rds_port}"
}


/* Production Concourse */
output "production_concourse_subnet" {
  value = "${module.concourse_production.concourse_subnet}"
}
output "production_concourse_security_group" {
  value = "${module.concourse_production.concourse_security_group}"
}
output "production_concourse_rds_url" {
  value = "${module.concourse_production.concourse_rds_url}"
}
output "production_concourse_elb_dns_name" {
  value = "${module.concourse_production.concourse_elb_dns_name}"
}


/* Staging Concourse */
output "staging_concourse_subnet" {
  value = "${module.concourse_staging.concourse_subnet}"
}
output "staging_concourse_security_group" {
  value = "${module.concourse_staging.concourse_security_group}"
}
output "staging_concourse_rds_url" {
  value = "${module.concourse_staging.concourse_rds_url}"
}
output "staging_concourse_elb_dns_name" {
  value = "${module.concourse_staging.concourse_elb_dns_name}"
}

