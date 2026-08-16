# output "ec2_public_ip" {
#   value = aws_instance.sharad-terraform[*].public_ip     #[*] allow all instances if not this then it give errorm as missing resource
# }


# output "ec2_public_dns" {
#   value = aws_instance.sharad-terraform[*].public_dns
# }


# output "ec2_instance_name" {
#   value = aws_instance.sharad-terraform[*].tags["Name"]
# }

#if you have multiplt instancewith for_each meta otherwie[*] for count meta 
output "aws_public_ip" {
 value = [
  for instance in aws_instance.sharad-terraform : instance.public_ip
 ]
}


output "aws_public_dns" {
 value = [
  for instance in aws_instance.sharad-terraform : instance.public_dns
 ]
}



output "aws_private_ip" {
 value = [
  for instance in aws_instance.sharad-terraform : instance.private_ip
 ]
}


output "aws_instance_name" {
 value = [
  for instance in aws_instance.sharad-terraform : instance.tags["Name"]
 ]
}