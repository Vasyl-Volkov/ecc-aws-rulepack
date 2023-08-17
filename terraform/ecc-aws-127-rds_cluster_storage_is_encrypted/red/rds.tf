resource "aws_rds_cluster" "this" {
  cluster_identifier  = "rds-127-red"
  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.03.2"
  database_name       = "rdsred"
  master_username     = "root"
  master_password     = random_password.this.result
  skip_final_snapshot = true
  storage_encrypted   = false
}

resource "random_password" "this" {
  length           = 12
  special          = true
  number           = true
  override_special = "!#$%*()-_=+[]{}:?"
}