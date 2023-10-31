resource "random_password" "this" {
  length           = 12
  special          = true
  override_special = "!#$%*()-_=+[]{}:?"
}

resource "aws_db_instance" "this" {
  identifier                      = "database-245-red"
  engine                          = "postgres"
  engine_version                  = "13.12"
  instance_class                  = "db.t3.micro"
  allocated_storage               = 10
  storage_type                    = "gp2"
  db_name                         = "red245"
  username                        = "root"
  password                        = random_password.this.result
  skip_final_snapshot             = true
  parameter_group_name            = aws_db_parameter_group.this.id
  enabled_cloudwatch_logs_exports = ["postgresql"]
  
  depends_on = [aws_db_parameter_group.this]
}

resource "aws_db_parameter_group" "this" {
  name   = "parameter-group-245-red"
  family = "postgres13"
}
