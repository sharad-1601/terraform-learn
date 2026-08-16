output "ec2_public_ip" {
  value = aws_instance.sharad-terraform[*].public_ip     #[*] allow all instances if not this then it give errorm as missing resource
}


output "ec2_public_dns" {
  value = aws_instance.sharad-terraform[*].public_dns
}


output "ec2_instance_name" {
  value = aws_instance.sharad-terraform[*].tags["Name"]
}