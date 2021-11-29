provider "aws" {
  region = eu-east-2
}

locals {
  name   = "demo-oracle"
  region = "eu-east-2"
  tags = {
    Environment = "dev"
  }
}

resource "aws_db_instance" "default" {

  identifier = "demodb-oracle"

  engine               = "oracle-ee"
  engine_version       = "12.1.0.2.v8"
  family               = "oracle-ee-12.1" # DB parameter group
  major_engine_version = "12.1"           # DB option group
  instance_class       = "db.t3.large"
  license_model        = "bring-your-own-license"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_encrypted     = false

  # Make sure that database name is capitalized, otherwise RDS will try to recreate RDS instance every time
  name                   = "DEMOORACLE"
  username               = "demo_oracle"
  create_random_password = true
  random_password_length = 12
  port                   = 1521

  multi_az               = true
  subnet_ids             = XXXXXX
  vpc_security_group_ids = XXXXX

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["alert", "audit"]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true


  character_set_name = "XXXXXX"

  tags = local.tags
}