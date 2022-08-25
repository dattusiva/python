# cluster subnet groups
resource "aws_db_subnet_group" "postgres_database_subnet_group" {
  name        = "database-security-group"
  description = "Subnet group PostgreSQL instance."
  subnet_ids  =  var.subnets_ids    # //variable date
}

# PostgrSQL cluster resource 
resource "aws_rds_cluster" "RdsCluster" {
  engine = var.engine                          # cluster engine
  engine_version = var.engine_version          # cluster engine_version
  cluster_identifier = var.cluster_identifier
  db_subnet_group_name = aws_db_subnet_group.postgres_database_subnet_group.name   # subnet groups name  
  master_username = var.master_username      # cluster username
  master_password = var.master_password      # cluster password
  port = var.port                            # PostgresSQL port
  skip_final_snapshot = true
  storage_encrypted = false
  backup_retention_period = 1
  deletion_protection = false
}

# cluster primary instance 

resource "aws_rds_cluster_instance" "RdsClusterInstance1" {    # instance resource
  cluster_identifier = aws_rds_cluster.RdsCluster.id
  instance_class = var.instance_class                          # inastance class
  engine = "aurora-postgresql"
  identifier = "${aws_rds_cluster.RdsCluster.id}instance"
}

resource "aws_rds_cluster_instance" "RdsClusterSecoundryInstance2" {
  cluster_identifier = aws_rds_cluster.RdsCluster.id
  instance_class = var.instance_class
  engine = "aurora-postgresql"
  identifier = "${aws_rds_cluster.RdsCluster.id}instance"
}