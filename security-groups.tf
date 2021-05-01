
resource "aws_security_group" "main_rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    description = "Traffic to MySQL port from members of this security group"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    self        = true
  }

  egress {
    description = "Traffic from RDS to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
