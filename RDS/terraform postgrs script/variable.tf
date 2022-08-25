variable "identifier"{
  default = "rds-terraform"
}
variable "rds_password"{
  default = "sivadattu"
}
variable "rds_username"{
  default = "paccardefault"
}
variable "db_engine"{
  default = "aurora-postgresql"
}
variable "storage_type"{
  default = "gp2"
}
variable "engine_version"{
  default = "13.6"
}
variable "instance_class"{
  default = "db.t3.medium"
}
