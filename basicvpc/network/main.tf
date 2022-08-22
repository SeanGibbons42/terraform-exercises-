resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Purpose = var.purpose
    Owner = var.owner
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "subnet_igw" {
  tags = {
    Purpose = var.purpose
    Owner = var.owner
  }
}

resource "aws_internet_gateway_attachment" "subnet_igw_attachment" {
    vpc_id = aws_vpc.vpc.id
    internet_gateway_id = aws_internet_gateway.subnet_igw.id
}
