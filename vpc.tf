resource "aws_vpc" "myappvpc" {
    cidr_block = var.vpcip
tags = {
  Name = var.vpcname
}
}
