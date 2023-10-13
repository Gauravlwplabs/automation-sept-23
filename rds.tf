resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_name                = "threetierdbsept"
  engine                 = "mysql"
  engine_version         = "8.0.33"
  instance_class         = "db.t3.micro"
  username               = var.db_user_name
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.allow_rds.id]
  db_subnet_group_name   = aws_db_subnet_group.this.id
}

resource "aws_db_subnet_group" "this" {
  name       = "subnet_group_${local.vpc_name_local}"
  subnet_ids = [for each_subnet in aws_subnet.pri_sub : each_subnet.id]

  tags = {
    Name = "My DB subnet group"
  }
}

