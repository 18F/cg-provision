/*
 * Variables required:
 *   vpc_id
 */


resource "aws_security_group" "rds_mysql" {
  description = "Allow access to incoming mysql traffic"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

output "rds_mysql_sg_id" {
  value = "${aws_security_group.rds_mysql.id}"
}