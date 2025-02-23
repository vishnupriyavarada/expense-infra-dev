#This code is from open source module
module "alb" {
  source = "terraform-aws-modules/alb/aws"

  # expense-dev-app-alb
  name     = "${var.projectname}-${var.environment}-app-alb"
  internal = true #define the alb is internal or private or backend
  vpc_id   = data.aws_ssm_parameter.vpc_id.value
  # private subnets. creating backend ALB 
  subnets = local.private_subnet_ids
  # create your own security group hence it's false
  create_security_group      = false
  security_groups            = [local.app_alb_sg_id]
  enable_deletion_protection = true
  tags = merge(
    var.common_tags,
    {
      Name = "${var.projectname}-${var.environment}-app-alb"
    }
  )
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"
    #backend is not yet created hence giving fixed_responser for testing alb listener
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "<h1> Hello, I am from backend app ALB </h1>"
      status_code  = "200"
    }
  }
  
}