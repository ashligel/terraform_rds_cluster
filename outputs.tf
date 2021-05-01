output "main_rds_sg" {
  value       = aws_security_group.main_rds_sg.id
  description = "The ID of the default RDS security group"
}

output "endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "The DB endpoint of the master node."
}

output "reader_endpoint" {
  value       = aws_db_instance.replica.endpoint
  description = "The DB endpoint of the reader node."
}
