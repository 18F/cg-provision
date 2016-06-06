resource "terraform_remote_state" "tooling_vpc" {
    backend = "s3"
    config {
        bucket = "${var.remote_state_bucket}"
        key = "tooling/terraform.tfstate"
    }
}

# Create peering connection for default_vpc -> tooling
resource "aws_vpc_peering_connection" "peering" {
    peer_owner_id = "${var.account_id}"
    peer_vpc_id = "${terraform_remote_state.tooling_vpc.output.vpc_id}"
    auto_accept = true
    vpc_id = "${var.default_vpc_id}"

    tags = {
        Name = "${var.default_vpc_id} to ${terraform_remote_state.tooling_vpc.output.vpc_id}"
    }
}

# Add peering connection to tooling private_route_table_az1 with default_vpc_cidr
resource "aws_route" "target_az1_to_source_cidr" {
    route_table_id = "${terraform_remote_state.tooling_vpc.output.private_route_table_az1}"
    destination_cidr_block = "${var.default_vpc_cidr}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.peering.id}"
}

# Add peering connection to tooling private_route_table_az2 with default_vpc_cidr
resource "aws_route" "target_az2_to_source_cidr" {
    route_table_id = "${terraform_remote_state.tooling_vpc.output.private_route_table_az2}"
    destination_cidr_block = "${var.default_vpc_cidr}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.peering.id}"
}

# add peering connection to default_vpc_route_table with tooling_vpc_cidr
resource "aws_route" "source_az1_to_target_cidr" {
    route_table_id = "${var.default_vpc_route_table}"
    destination_cidr_block = "${terraform_remote_state.tooling_vpc.output.vpc_cidr}"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.peering.id}"
}

# Add security group to default_vpc to allow tooling traffic
resource "aws_security_group" "allow_all_tooling" {
    name = "allow_all_tooling"
    description = "Bootstrap allow all from tooling vpc"
    vpc_id = "${var.default_vpc_id}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${terraform_remote_state.tooling_vpc.output.vpc_cidr}"]
    }

}

# Add security group to tooling vpc to allow default_vpc traffic
resource "aws_security_group" "allow_all_default" {
    name = "allow_all_default"
    description = "Bootstrap allow all from default vpc"
    vpc_id = "${terraform_remote_state.tooling_vpc.output.vpc_id}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["${var.default_vpc_cidr}"]
    }

}