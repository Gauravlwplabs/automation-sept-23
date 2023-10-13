output "vpc_id" {
  value = aws_vpc.main.id
}

# example of retriving value for resource block with for-each argument

output "public_subnet_ids" {
  value = { for index, each_subnet in aws_subnet.public_subnet : index => each_subnet.id }
}

# example of splat expression -- retriving value for resource block with count argument
# output "instance_ids" {
#   value = aws_instance.web[*].id
# }

output "private_subnet_ids" {
  value = { for index, each_subnet in aws_subnet.pri_sub : index => each_subnet.id }
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "isDnsSupportenabled" {
  value = aws_vpc.main.enable_dns_support
}

output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = module.autoscaling.autoscaling_group_name
}