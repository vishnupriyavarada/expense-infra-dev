module "vpc" {
  # source               = "../terraform-aws-vpc" // this method is used when your code is in local
  source               = "git::https://github.com/vishnupriyavarada/terraform-aws-vpc.git?ref=main"
  projectname          = var.projectname
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  common_tags          = var.common_tags
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  database_subnet_cidr = var.database_subnet_cidr
  is_peering_required  = true
}