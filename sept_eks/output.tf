output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = { for index, each_subnet in aws_subnet.public_subnet : index => each_subnet.id }
}

output "private_subnet_ids" {
  value = { for index, each_subnet in aws_subnet.private_subnet : index => each_subnet.id }
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}