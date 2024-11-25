output "eks_node_group_id" {
  description = "ID of the node group"
  value       = aws_eks_node_group.eks_node_group_module.id
}

output "eks_node_group_arn" {
  description = "ARN of the node group"
  value       = aws_eks_node_group.eks_node_group_module.arn
}