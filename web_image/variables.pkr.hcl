variable server_name {
  description = "name of the golden image"
  type        = string
  default     = "apache-web"
}

variable instance_type {
  type    = string
  default = "t2.micro"
}

variable region {
  type = string
}

variable ssh_user_name {
  type    = string
  default = "ec2-user"
}

variable ami_id {
  type    = string
  default = "ami-067d1e60475437da2"
}