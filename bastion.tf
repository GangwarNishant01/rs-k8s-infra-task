resource "aws_instance" "bastion" {
  ami           = "ami-045a8ab02aadf4f88" # Change this to a valid AMI for your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public[0].id
  key_name      = "shell" # Change this to your key pair name

  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  
  associate_public_ip_address = true  # Ensure the instance gets a public IP

  tags = {
    Name = "k8s-bastion"
  }

  depends_on = [aws_security_group.k8s_sg]

}

