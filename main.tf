provider "aws" {
  region = var.region
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_ids   = var.subnet_ids
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks.eks_cluster_id
}

module "k8s" {
  source                  = "./modules/k8s"
  image_url               = var.image_url
  eks_cluster_endpoint    = module.eks.eks_cluster_endpoint
  eks_cluster_ca_cert     = module.eks.eks_cluster_ca_cert
  eks_cluster_auth_token  = data.aws_eks_cluster_auth.eks_auth.token
}
