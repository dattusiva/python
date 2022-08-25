terraform {
  required_providers {
    aws = {
    source  = "hashicorp/aws"
    version = "~> 4.22.0"
    }
  }

  required_version = ">= 0.14.9"
}

resource "aws_db_instance" "finix_rds" {
allocated_storage = 20
identifier = var.identifier
storage_type = var.storage_type
engine = var.db_engine
engine_version = var.engine_version
instance_class = var.instance_class
port = "5432"
db_name = "Aurorapostgres_instance"
username = var.rds_username
password = var.rds_password
publicly_accessible    = true
skip_final_snapshot    = true


  tags = {
    Name = "ExampleRDSServerInstance"
  }
}
