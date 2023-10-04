variable "vpc_cidr" {
  description = "cidr range for vpc"
  type        = string
}

variable "tenancy" {
  type        = string
  description = "Instance tenenacy in vpc"
  default     = "default"
}

variable "vpc_name" {
  type        = string
  description = "name of the vpc"
}

variable "num_of_subnets" {
  type        = number
  description = "number of subnets to be created"
}

variable "jump_server_image_name" {
  type    = string
  default = "ami-067d1e60475437da2"
}

variable "jump_server_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ingress_web" {
  type = list(object({
    description = string
    to_port     = number
    from_port   = number
    protocol    = string
  }))
  default = [{
    description = "allow ssh"
    to_port     = 22
    from_port   = 22
    protocol    = "tcp"
    },
    {
      description = "allow web"
      to_port     = 80
      from_port   = 80
      protocol    = "tcp"
  }]
}
