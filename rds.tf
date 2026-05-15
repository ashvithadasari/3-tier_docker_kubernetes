resource "aws_db_subnet_group" "mysql_subnet_group" {
  subnet_ids = [
    aws_subnet.private_subnet[0].id,
    aws_subnet.private_subnet[1].id
  ]

  tags = {
    Name = var.sgname
  }
}

resource "aws_db_instance" "mysql" {

  identifier = "mydb"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "hospitaldb"
  username = "admin"
  password = "Ashvitha123"

  publicly_accessible = false

  multi_az = false

  db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name

  vpc_security_group_ids = [
    aws_security_group.rdssg.id
  ]

  skip_final_snapshot = true

  tags = {
    Name = var.rds
  }
}