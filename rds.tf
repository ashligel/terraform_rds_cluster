resource "aws_db_instance" "main" {
  allocated_storage = var.allocated_storage
  engine            = "mysql"
  engine_version    = var.engine_version
  instance_class    = var.instance_class

  identifier                = var.cluster_identifier
  username                  = var.master_username
  password                  = var.master_password
  backup_retention_period   = var.backup_retention_period
  final_snapshot_identifier = "${var.cluster_identifier}-final"

  availability_zone      = element(var.availability_zones, 0)
  vpc_security_group_ids = [aws_security_group.main_rds_sg.id]
  parameter_group_name   = aws_db_parameter_group.main.id
  db_subnet_group_name   = aws_db_subnet_group.private.name
  multi_az               = var.multi_az
  iops                   = var.iops
}

resource "aws_db_instance" "replica" {
  engine         = "mysql"
  engine_version = var.engine_version
  instance_class = var.instance_class

  replicate_source_db = aws_db_instance.main.id
  availability_zone   = element(var.availability_zones, 1)

  identifier                = "${var.cluster_identifier}-read"
  backup_retention_period   = var.backup_retention_period
  skip_final_snapshot       = true

  vpc_security_group_ids = [aws_security_group.main_rds_sg.id]
  parameter_group_name   = aws_db_parameter_group.main.id
  iops                   = var.iops
}

resource "aws_db_parameter_group" "main" {
  name        = "${var.cluster_identifier}-pg"
  family      = "mysql8.0"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "slow_query_log"
    value = "1"
  }
}

resource "aws_db_subnet_group" "private" {
  name       = "${var.cluster_identifier}-private"
  subnet_ids = var.private_subnet_ids
}