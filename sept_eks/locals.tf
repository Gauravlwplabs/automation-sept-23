locals {
  newbits = ceil(log(var.num_of_subnets, 2))
}