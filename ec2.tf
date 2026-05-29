
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
  connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file(var.ssh_key_name)
  host        = self.public_ip
  timeout     = "4m"
}

provisioner "remote-exec" {
    inline = [

      # Update packages
      "sudo apt update -y",

      # Install Git
      "sudo apt install git -y",

      # Install AWS CLI
      "curl \"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip\" -o \"awscliv2.zip\"",
      "sudo apt install unzip -y",
      "unzip awscliv2.zip",
      "sudo ./aws/install",

      # Install kubectl
      "curl -LO \"https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl\"",
      "chmod +x kubectl",
      "sudo mv kubectl /usr/local/bin/",

      # Verify installations
      "git --version",
      "aws --version",
      "kubectl version --client"
    ]
  }
}



