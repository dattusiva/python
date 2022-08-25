# cluster engine data

variable "engine"{
  default = "aurora-postgresql"
}
variable "engine_version"{
  default = "13.6"
}
variable "cluster_identifier"{
  default = "aurora-postgres-cluster"
}
variable "db_subnet_group_name"{
  default = "aws_db_subnet_group.postgres_database_subnet_group.name"
}
variable "master_username"{
  default = ""
}
variable "master_password"{
  default = ""
}

variable "cluster_identifier"{
  default = "aws_rds_cluster.RdsCluster.id"
}
variable "instance_class"{
  default = "db.t3.medium"
}
variable "engine"{	
  default = "aurora-postgresql"
}
variable "identifier"{
  default = "${aws_rds_cluster.RdsCluster.id}instance"
}
