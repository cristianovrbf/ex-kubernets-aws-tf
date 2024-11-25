variable "subnet_172_31_1_0_24_id" {
  type        = string
  description = "ID of the subnet 172.31.1.0/24"
  default     = "subnet-0f063c7a7ee981429"
}

variable "subnet_172_31_2_0_24_id" {
  type        = string
  description = "ID of the subnet 172.31.2.0/24"
  default     = "subnet-0b7c13fa1c5e979e0"
}

variable "subnet_172_31_3_0_24_id" {
  type        = string
  description = "ID of the subnet 172.31.3.0/24"
  default     = "subnet-025a428759fe95db6"
}

variable "security_group_eks_cluster" {
  type        = string
  description = "Security Group Cluster EKS"
  default     = "eks-cluster-sg-EKSDeepDive-291382131"
}

variable "cdcp_eks_cluster_name" {
  type        = string
  description = "Name of the CDCP EKS cluster"
  default     = "EKSDeepDive"
}