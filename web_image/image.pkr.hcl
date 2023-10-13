locals {
  image_name = "${var.server_name}-lwplab-packer"
}

source "amazon-ebs" "this" {
  assume_role {
    role_arn     = "arn:aws:iam::869510502397:role/admin_role"
    session_name = "packer-session"
  }
  ami_name      = local.image_name
  instance_type = var.instance_type
  region        = var.region
  source_ami    = var.ami_id
  ssh_username  = var.ssh_user_name
  profile       = "batch_sept"
}

build {
  sources = [
    "source.amazon-ebs.this"
  ]
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo echo '<h1>Hello world! we are learning automation</h1>'| sudo tee /var/www/html/index.html"
    ]
  }
}
