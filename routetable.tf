resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.myappvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }

    tags = {
        Name = var.publicrt
  }
}

resource "aws_route_table_association" "RTA" {
  count          = 2
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.myappvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.NAT.id
    }

    tags = {
        Name = var.privatert
  }
}

resource "aws_route_table_association" "PRTA" {
  count          = 2
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}


  
