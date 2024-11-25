resource "aws_eks_node_group" "eks_node_group_module" {
  cluster_name    = var.cluster_name
  node_group_name = "nodeGroup${var.pairNumber}"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnets
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_size
    min_size     = var.min_size
  }

  tags = var.general_tags
}