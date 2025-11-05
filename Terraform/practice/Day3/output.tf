#   output for count meta argument

#   output "ec2_public_ip" {
#    value = aws_instance.my_instance[*].public_ip
#   }

#   output "ec2_public_dns" {
#    value = aws_instance.my_instance[*].public_dns
#   }

# output for for_each meta argument

output "ec2_public_ip" {
  
  value = [
      for instance in aws_instance.my_instance : instance.public_ip
  ]
}

output "ec2_public_dns" {
  
  value = [
      for instance in aws_instance.my_instance : instance.public_dns
  ]
}