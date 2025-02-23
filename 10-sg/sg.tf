module "mysql_sg" {
  #source = "../terraform-aws-securitygroup" // this method is used when your code is in local
  source = "git::https://github.com/vishnupriyavarada/terraform-aws-securitygroup.git?ref=main" 
  environment    = var.environment
  sg_description = var.sg_db_description
  sg_name        = var.sg_db_name
  project_name   = var.projectname
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

module "backend_sg" {
  #source = "../terraform-aws-securitygroup" // this method is used when your code is in local
  source = "git::https://github.com/vishnupriyavarada/terraform-aws-securitygroup.git?ref=main" 
  environment    = var.environment
  sg_description = var.sg_backend_description
  sg_name        = var.sg_backend_name
  project_name   = var.projectname
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

module "frontend_sg" {
  #source = "../terraform-aws-securitygroup" // this method is used when your code is in local
  source = "git::https://github.com/vishnupriyavarada/terraform-aws-securitygroup.git?ref=main" 
  environment    = var.environment
  sg_description = var.sg_frontend_description
  sg_name        = var.sg_frontend_name
  project_name   = var.projectname
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

//-------------- Bastion SG ------------------

module "bastion_sg" {
  #source = "../terraform-aws-securitygroup" // this method is used when your code is in local
  source = "git::https://github.com/vishnupriyavarada/terraform-aws-securitygroup.git?ref=main" 
  environment    = var.environment
  sg_description = var.sg_bastion_description
  sg_name        = var.sg_bastion_name
  project_name   = var.projectname
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

//-------------- Backend ALB SG ------------------

module "app_alb_sg" {
  #source = "../terraform-aws-securitygroup" // this method is used when your code is in local
  source = "git::https://github.com/vishnupriyavarada/terraform-aws-securitygroup.git?ref=main" 
  environment    = var.environment
  sg_description = var.sg_app_alb_description
  sg_name        = var.sg_app_alb_name
  project_name   = var.projectname
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}