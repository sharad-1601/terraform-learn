variable "ec2_instance_type" {
  default = "t3.micro"
  type = string
}


variable "ec2_root_storage_size" { 
  default = 8
  type = number
}


variable "ec2_ami_id" {
  default = "ami-04bc53b7a499f5d37"
  type = string
}

variable "environment" {
  default = "dev"
}