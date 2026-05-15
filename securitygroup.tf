resource "aws_security_group" "ec2sg" {
    vpc_id = aws_vpc.myappvpc.id
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
    ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   

  tags = {
    Name = var.sgname1
  }
}

resource "aws_security_group" "rdssg" {
    vpc_id = aws_vpc.myappvpc.id
    ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [ aws_security_group.ec2sg.id ]
  }
 
   

  tags = {
    Name = var.sgname2
  }
}


