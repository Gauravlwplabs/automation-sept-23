variable "vpc_cidr" {
  description = "cidr range for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  type        = string
  description = "Instance tenenacy in vpc"
  default     = "default"
}

variable "vpc_name" {
  type        = string
  description = "name of the vpc"
  default     = "eks-vpc"
}

variable "num_of_subnets" {
  type        = number
  description = "number of subnets to be created"
  default     = 4
}

variable "region" {
  type        = string
  description = "AWS region for cluster creation"
  default     = "us-east-1"
}

variable "eks_cluster_name" {
  description = "cluster name for eks"
  type        = string
  default     = "eks-demo-sept"
}

variable "ami_type" {
  type        = string
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group"
  default     = "AL2_x86_64"
}

variable "node_group_instance_types" {
  type        = list(string)
  description = "List of instance types associated with the EKS Node Group"
  default     = ["t3.medium"]
}

variable "node_group_name" {
  type        = string
  description = "Name for your node group"
  default     = "demo-eks-nodegroup"
}

variable "capacity_type" {
  type        = string
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  default     = "ON_DEMAND"
  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.capacity_type)
    error_message = "Invalid input, Valid values: ON_DEMAND, SPOT"
  }
}