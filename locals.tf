locals {
  vpc_name_local = "${var.vpc_name}-lwplabs"
  #newbits        = var.num_of_subnets == 2 ? 1 : var.num_of_subnets == 4 ? 2 : (var.num_of_subnets == 6 || var.num_of_subnets == 8) ? 3 : 4 
  newbits = ceil(log(var.num_of_subnets, 2))
}