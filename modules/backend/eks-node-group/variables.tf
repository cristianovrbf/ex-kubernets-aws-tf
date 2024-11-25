variable "general_tags" {
  type        = map(string)
  description = "Tags that is general for all resources"
}

variable "pairNumber" {
  type        = string
  description = "Number of the pair"
}

variable "node_role_arn" {
  description = "ARN of the role of node"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster name of the Node Group"
  type        = string
}

variable "subnets" {
  description = "Subnets of the Node Group"
  type        = list(string)
}

variable "instance_types" {
  description = "Instance types of the Node Group"
  type        = list(string)
}

variable "desired_capacity" {
  type        = number
  description = "Node Group Desired Capacity"
}

variable "max_size" {
  type        = number
  description = "Node Group Max Size"
}

variable "min_size" {
  type        = number
  description = "Node Group Min Size"
}
