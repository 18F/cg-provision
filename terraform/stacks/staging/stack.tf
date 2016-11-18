module "stack" {
    source = "../../modules/stack/spoke"

    stack_description = "${var.stack_description}"
    aws_partition = "${var.aws_partition}"
    vpc_cidr = "${var.vpc_cidr}"
    aws_default_region = "${var.aws_default_region}"
    public_cidr_1 = "${var.public_cidr_1}"
    public_cidr_2 = "${var.public_cidr_2}"
    private_cidr_1 = "${var.private_cidr_1}"
    private_cidr_2 = "${var.private_cidr_2}"
    rds_private_cidr_1 = "${var.rds_private_cidr_1}"
    rds_private_cidr_2 = "${var.rds_private_cidr_2}"
    restricted_ingress_web_cidrs = "${var.restricted_ingress_web_cidrs}"
    rds_password = "${var.rds_password}"
    rds_encrypted = true
    account_id = "${var.account_id}"
    remote_state_bucket = "${var.remote_state_bucket}"
    target_stack_name = "${var.target_stack_name}"

}

module "cf" {
    source = "../../modules/cloudfoundry"

    account_id = "${var.account_id}"
    stack_description = "${var.stack_description}"
    aws_partition = "${var.aws_partition}"
    elb_main_cert_name = "${var.main_cert_name}"
    elb_apps_cert_name = "${var.apps_cert_name}"
    elb_subnets = "${module.stack.public_subnet_az1},${module.stack.public_subnet_az2}"
    elb_security_groups = "${module.stack.web_traffic_security_group}"

    rds_password = "${var.cf_rds_password}"
    rds_subnet_group = "${module.stack.rds_subnet_group}"
    rds_security_groups = "${module.stack.rds_postgres_security_group}"
    stack_prefix = "cf-staging"

    vpc_id = "${module.stack.vpc_id}"
    private_route_table_az1 = "${module.stack.private_route_table_az1}"
    private_route_table_az2 = "${module.stack.private_route_table_az2}"
    services_cidr_1 = "${var.services_cidr_1}"
    services_cidr_2 = "${var.services_cidr_2}"
    kubernetes_cluster_id = "${var.kubernetes_cluster_id}"

}

module "diego" {
    source = "../../modules/diego"

    stack_description = "${var.stack_description}"
    elb_subnets = "${module.stack.public_subnet_az1},${module.stack.public_subnet_az2}"

    vpc_id = "${module.stack.vpc_id}"
    private_route_table_az1 = "${module.stack.private_route_table_az1}"
    private_route_table_az2 = "${module.stack.private_route_table_az2}"
    diego_cidr_1 = "${var.diego_cidr_1}"
    diego_cidr_2 = "${var.diego_cidr_2}"
}

module "kubernetes" {
    source = "../../modules/kubernetes"

    stack_description = "${var.stack_description}"
    aws_default_region = "${var.aws_default_region}"

    vpc_id = "${module.stack.vpc_id}"
    vpc_cidr = "${var.vpc_cidr}"
    tooling_vpc_cidr = "${module.stack.tooling_vpc_cidr}"
    elb_subnets = "${module.cf.services_subnet_az1},${module.cf.services_subnet_az2}"
    target_bosh_security_group = "${module.stack.bosh_security_group}"
}

module "shibboleth" {
    source = "../../modules/shibboleth"

    stack_description = "${var.stack_description}"
    elb_subnets = "${module.stack.public_subnet_az1},${module.stack.public_subnet_az2}"

    elb_shibboleth_cert_name = "${var.elb_shibboleth_cert_name}"
    elb_security_groups = "${module.stack.web_traffic_security_group}"
    stack_description = "${var.stack_description}"
    account_id = "${var.account_id}"
    aws_partition = "${var.aws_partition}"
}
