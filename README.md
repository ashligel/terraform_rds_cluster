# Terraform: RDS Cluster (Master & Read Replica)

The resources created are:
- *Master*: The RDS accepting both read and write operations. This will act as the source for the read replica. In this specific template, the storage is set as <b>io1</b>.
- *Read Replica*: The RDS read replica accepting read operations only.
- *RDS Security Group*
- *DB Subnet Group and Parameter Groups*

## variables.tf

Variable Name|Type|Description|
---|---|---|
allocated_storage|string|The storage allocated for the RDS|
availability_zones|list(string)|A list of the AZs where the RDS will reside.
backup_retention_period|number|Defines the number of days to keep the backup|
cluster_identifier|string|The identifier to assign to the cluster
database_name|string|The database name|
engine_version|string|The MySQL engine version|
instance_class|string|The instance class for the database|
iops|string|The assigned IOPS for io1 storage|
master_username|string| - |
master_password|string| - |
multi_az|bool|Defines if the RDS will be set as multi-az|
private_subnet_ids|list(string)|The private subnets to deploy the RDS into|
vpc_id|string|The VPC to deploy the RDS into|