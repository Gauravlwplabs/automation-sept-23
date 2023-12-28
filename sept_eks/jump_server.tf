resource "aws_instance" "jump_server" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  key_name      = "mykey"
  subnet_id     = element([for each_subnet in aws_subnet.public_subnet : each_subnet.id], 0)
  tags = {
    Name = "Jump-server"
  }
  vpc_security_group_ids = [aws_security_group.allow_ssh_jump_server.id]
}