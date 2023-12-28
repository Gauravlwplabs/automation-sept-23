resource "aws_eks_cluster" "main" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids              = [for each_subnet in aws_subnet.private_subnet : each_subnet.id]
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids = [aws_security_group.allow_api_access.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment,
  ]
}

resource "aws_eks_node_group" "this" {
  ami_type        = var.ami_type
  capacity_type   = var.capacity_type
  instance_types  = var.node_group_instance_types
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_cluster_node_role.arn
  subnet_ids      = [for each_subnet in aws_subnet.private_subnet : each_subnet.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  remote_access {
    ec2_ssh_key               = "mykey"
    source_security_group_ids = [aws_security_group.allow_ssh_jump_server.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [aws_iam_role_policy_attachment.eks_cluster_node_role_attachment]
}

