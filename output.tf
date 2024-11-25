output "vpc_cdcp_id" {
  description = "ID of the VPC"
  value       = data.aws_vpc.vpc_cdcp.id
}

output "vpc_cdcp_cidr_block" {
  description = "CIDR block of the VPC"
  value       = data.aws_vpc.vpc_cdcp.cidr_block
}

output "vpc_cdcp_arn" {
  description = "ARN of the VPC"
  value       = data.aws_vpc.vpc_cdcp.arn
}

output "cdcp_subnet_172_31_2_0_24_arn" {
  description = "ARN of the CDCP subnet 172.31.2.0/24"
  value       = data.aws_subnet.subnet_172_31_2_0_24.arn
}

output "cdcp_subnet_172_31_2_0_24_id" {
  description = "ID of the CDCP subnet 172.31.2.0/24"
  value       = data.aws_subnet.subnet_172_31_2_0_24.id
}

output "cdcp_subnet_172_31_2_0_24_cidr_block" {
  description = "CIDR Block of the CDCP subnet 172.31.2.0/24"
  value       = data.aws_subnet.subnet_172_31_2_0_24.cidr_block
}

output "cdcp_subnet_172_31_3_0_24_arn" {
  description = "ARN of the CDCP subnet 172.31.3.0/24"
  value       = data.aws_subnet.subnet_172_31_3_0_24.arn
}

output "cdcp_subnet_172_31_3_0_24_id" {
  description = "ID of the CDCP subnet 172.31.3.0/24"
  value       = data.aws_subnet.subnet_172_31_3_0_24.id
}

output "cdcp_subnet_172_31_3_0_24_cidr_block" {
  description = "CIDR Block of the CDCP subnet 172.31.3.0/24"
  value       = data.aws_subnet.subnet_172_31_3_0_24.cidr_block
}

output "cdcp_subnet_172_31_1_0_24_arn" {
  description = "ARN of the CDCP subnet 172.31.1.0/24"
  value       = data.aws_subnet.subnet_172_31_1_0_24.arn
}

output "cdcp_subnet_172_31_1_0_24_id" {
  description = "ID of the CDCP subnet 172.31.1.0/24"
  value       = data.aws_subnet.subnet_172_31_1_0_24.id
}

output "cdcp_subnet_172_31_1_0_24_cidr_block" {
  description = "CIDR Block of the CDCP subnet 172.31.1.0/24"
  value       = data.aws_subnet.subnet_172_31_1_0_24.cidr_block
}

output "eks_cluster_arn" {
  description = "ARN of CDCP EKS cluster"
  value       = data.aws_eks_cluster.cdcp_eks_cluster.arn
}

output "eks_cluster_security_group_id" {
  description = "ID of eks cluster security group"
  value       = data.aws_security_group.security_group_eks_cluster
}

output "eks_cluster_id" {
  description = "ID of CDCP EKS cluster"
  value       = data.aws_eks_cluster.cdcp_eks_cluster.id
}

output "eks_cluster_auth_id" {
  description = "ID of Auth CDCP EKS cluster"
  value       = data.aws_eks_cluster_auth.cdcp_eks_cluster_auth.id
}

output "eks_cluster_auth_name" {
  description = "Name of Auth CDCP EKS cluster"
  value       = data.aws_eks_cluster_auth.cdcp_eks_cluster_auth.name
}