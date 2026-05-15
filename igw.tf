resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.myappvpc.id
    tags =  {
        Name = var.igwname
    }
}

