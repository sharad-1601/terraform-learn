output "ec2_public_ip" {
  value = aws_instance.sharad-terraform.public_ip
}


output "ec2_public_dns" {
  value = aws_instance.sharad-terraform.public_dns
}


output "ec2_instance_name" {
  value = aws_instance.sharad-terraform.tags["Name"]
}