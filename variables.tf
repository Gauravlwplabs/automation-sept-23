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

#4 subnets 2 public subnet 2 private subnet

# variable "cidr_public_subnet" {
#   type        = map(string)
#   description = "CIDR ranges for  public subnets"
# }

# variable "cidr_private_subnet" {
#   type        = list(string)
#   description = "CIDR ranges for private subnets"
# }

