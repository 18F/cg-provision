module "stack" {
    source = "../../modules/stack/spoke"

    stack_description = "${var.stack_description}"
    vpc_cidr = "${var.vpc_cidr}"
    public_cidr_1 = "${var.public_cidr_1}"
    public_cidr_2 = "${var.public_cidr_2}"
    private_cidr_1 = "${var.private_cidr_1}"
    private_cidr_2 = "${var.private_cidr_2}"
    rds_private_cidr_1 = "${var.rds_private_cidr_1}"
    rds_private_cidr_2 = "${var.rds_private_cidr_2}"
    rds_password = "${var.rds_password}"
    account_id = "${var.account_id}"
    remote_state_bucket = "${var.remote_state_bucket}"
    target_stack_name = "${var.target_stack_name}"

}

module "cf" {
    source = "../../modules/cloudfoundry"

    account_id = "${var.account_id}"
    stack_description = "${var.stack_description}"
    elb_main_cert_name = "${var.main_cert_name}"
    elb_apps_cert_name = "${var.apps_cert_name}"
    elb_subnets = "${module.stack.public_subnet_az1},${module.stack.public_subnet_az1}"
    elb_security_groups = "${module.stack.web_traffic_security_group}"
}
