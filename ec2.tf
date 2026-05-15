



resource "aws_instance" "myappec2" {

  ami           = "ami-07a00cf47dbbc844c"

  instance_type = "t3.micro"
  

  subnet_id = aws_subnet.public_subnet[0].id

  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.ec2sg.id
  ]

  key_name = var.ssh_key_name1



  tags = {
    Name = var.ec2name
  }
}




