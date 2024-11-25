terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }
  backend "s3" {
    bucket = "remote-backend-asn-cvrbf-pfamf"
    key    = "dev/terraform.tfstate"
    region = "ca-central-1"
  }
}

provider "aws" {
  region = "ca-central-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cdcp_eks_cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cdcp_eks_cluster_auth.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cdcp_eks_cluster.certificate_authority[0].data)
}

