data "aws_vpc" "vpc_cdcp" {
  filter {
    name   = "tag:Name"
    values = ["myvpc-cdcp"]
  }
}

data "aws_subnet" "subnet_172_31_2_0_24" {
  id = var.subnet_172_31_2_0_24_id
}

data "aws_subnet" "subnet_172_31_3_0_24" {
  id = var.subnet_172_31_3_0_24_id
}

data "aws_subnet" "subnet_172_31_1_0_24" {
  id = var.subnet_172_31_1_0_24_id
}

data "aws_security_group" "security_group_eks_cluster" {
  filter {
    name   = "tag:Name"
    values = [var.security_group_eks_cluster]
  }
}

data "aws_eks_cluster" "cdcp_eks_cluster" {
  name = var.cdcp_eks_cluster_name
}

data "aws_eks_cluster_auth" "cdcp_eks_cluster_auth" {
  name = data.aws_eks_cluster.cdcp_eks_cluster.name
}

resource "aws_iam_role" "eks_node_role" {
  name = "EKSNodeGroupRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}


module "node_group_cvrbf_pfamf" {
  source        = "./modules/backend/eks-node-group"
  pairNumber    = local.pairNumber
  node_role_arn = aws_iam_role.eks_node_role.arn
  cluster_name  = data.aws_eks_cluster.cdcp_eks_cluster.name
  subnets = [
    data.aws_subnet.subnet_172_31_1_0_24.id,
    data.aws_subnet.subnet_172_31_2_0_24.id,
    data.aws_subnet.subnet_172_31_3_0_24.id,
  ]
  desired_capacity = 1
  max_size         = 2
  min_size         = 1
  general_tags     = local.common_tags
  instance_types   = ["t3.small"]
}

resource "kubernetes_deployment" "wordpress_deployment" {
  metadata {
    name = "wordpress"
    labels = {
      app = "wordpress"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "wordpress"
      }
    }
    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }

      spec {
        container {
          image = "public.ecr.aws/wordpress/wordpress:latest"
          name  = "wordpress"
          port {
            container_port = 80
          }
          resources {
            requests = {
              cpu    = "500m"
              memory = "512Mi"
            }
            limits = {
              cpu    = "1"
              memory = "1Gi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "wordpress_service" {
  metadata {
    name = "wordpress-service"
  }

  spec {
    selector = {
      app = "wordpress"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
