data "aws_ami" "mydevops"{
    most_recent = true
    owners = ["973714476881"] //owner of the ami. don't change this

   filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.projectname}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.projectname}/${var.environment}/public_subnet_ids"
}

