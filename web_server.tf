resource "aws_instance" "web_server" {
  ami           = data.aws_ami.this.image_id
  instance_type = var.web_server_instance_type
  key_name      = aws_key_pair.this.key_name
  subnet_id     = element([for each_subnet in aws_subnet.pri_sub : each_subnet.id], 0)
  tags = {
    Name = "web-server-${local.vpc_name_local}"
  }
  vpc_security_group_ids = [aws_security_group.allow_ssh_jump_server.id]
}

# resource "aws_instance" "web_server_usw1" {
#   ami           = data.aws_ami.this.image_id
#   provider      = aws.usw1
#   instance_type = var.web_server_instance_type
#   key_name      = aws_key_pair.this.key_name
#   subnet_id     = element([for each_subnet in aws_subnet.pri_sub : each_subnet.id], 0)
#   tags = {
#     Name = "web-server-${local.vpc_name_local}"
#   }
#   vpc_security_group_ids = [aws_security_group.allow_ssh_jump_server.id]
# }