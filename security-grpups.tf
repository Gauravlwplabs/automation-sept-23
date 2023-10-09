resource "aws_security_group" "allow_ssh_jump_server" {
  name        = "allow_ssh_jump_server"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_jum_server_${local.vpc_name_local}"
  }
}

resource "aws_security_group" "allow_web_server" {
  name        = "allow_web_server"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_web
    content {
      description = ingress.value.description
      to_port     = ingress.value.to_port
      from_port   = ingress.value.from_port
      protocol    = ingress.value.protocol
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_server_access_${local.vpc_name_local}"
  }
}

resource "aws_security_group" "lb_sg" {
  name        = "allow_lb"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_lb_${local.vpc_name_local}"
  }
}