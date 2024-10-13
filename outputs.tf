output "vpc_id" {
  value = aws_vpc.k8s_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "security_group_id" {
  value = aws_security_group.k8s_sg.id
}


