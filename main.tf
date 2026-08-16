#s3 bucket

resource "aws_s3_bucket" terra-bucket {
  bucket = "sharad-terraform-bucket"
}

#aws-instance


#key-pair

resource "aws_key_pair" "mykey" {
  
  key_name = "sharad-terraform-ec2"
  public_key = file("sharad-terraform-ec2.pub")
}


#vpc

resource "aws_default_vpc" "default" {
  
}


#security group

resource "aws_security_group" "terraform-sg" {
  name = "sharad-terraform-sg"
  description = "this will add a sg to tf generated file"
  vpc_id = aws_default_vpc.default.id    #interpolation

  #inbound rules

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh opened"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http opened"
  }

  #outbound rules

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"
  }


  tags = {
    "Name" = "sharad-terraform-sg"
  }
}


#instance


resource "aws_instance" "sharad-terraform" {
  count = 4   #meta argument(means it create the instances equesl to count).
  key_name = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  instance_type = var.ec2_instance_type
  # ami = "ami-04bc53b7a499f5d37"  #aws-linux
  ami = var.ec2_ami_id
  user_data = file("install_nginx.sh")



  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    "Name" = "sharad-terra-devops"
  }

}