

module "tooling_stack" {
    source = "../tooling"

    rds_password = "${var.tooling_rds_password}"

}

module "prod_stack" {
    source = "../production"

    rds_password = "${var.prod_rds_password}"
    peer_owner_id = "${var.peer_owner_id}"
    target_vpc_id = "${module.tooling_stack.vpc_id}"
    target_az1_private_route_table = "${module.tooling_stack.private_route_table_az1}"
    target_az2_private_route_table = "${module.tooling_stack.private_route_table_az2}"

}