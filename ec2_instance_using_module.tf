module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "sharad-terraform-module-app"


  instance_type = "t3.micro"
  key_name      = "sharad-terraform-ec2"
  monitoring    = false
  subnet_id     = "subnet-05305894a17b1868e"

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}