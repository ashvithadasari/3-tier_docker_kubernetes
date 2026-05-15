resource "aws_subnet" "public_subnet" {
  count = 2
  vpc_id                  = aws_vpc.myappvpc.id
  cidr_block              = cidrsubnet(aws_vpc.myappvpc.cidr_block, 8, count.index)
  availability_zone       = element(["ap-south-1a", "ap-south-1b"], count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnetname}-${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {

  count = 2

  vpc_id = aws_vpc.myappvpc.id

  cidr_block = cidrsubnet(
    aws_vpc.myappvpc.cidr_block,
    8,
    count.index + 2
  )

  availability_zone = element(
    ["ap-south-1a", "ap-south-1b"],
    count.index
  )

  map_public_ip_on_launch = false

  tags = {
    Name = "${var.psubnetname}-${count.index}"
  }
}