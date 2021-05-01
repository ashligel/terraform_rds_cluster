variable "allocated_storage" {
  type    = string
  default = 100
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b"]
}

variable "backup_retention_period" {
  type    = number
  default = 1
}

variable "cluster_identifier" {
  type = string
}

variable "database_name" {
  type = string
}

variable "engine_version" {
  type    = string
  default = "8.0"
}

variable "instance_class" {
  type    = string
  default = "db.m5.large"
}

variable "iops" {
  type        = string
  description = "The provisioned IOPS for the RDS storage. Leave empty if gp2."
  default     = "700"
}

variable "master_username" {
  type = string
}

variable "master_password" {
  type = string
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}