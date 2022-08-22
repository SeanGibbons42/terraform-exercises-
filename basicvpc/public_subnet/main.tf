resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_range

  tags = {
    Purpose = var.purpose
    Owner = var.owner
    Name = var.subnet_name
  }
}

resource "aws_eip" "nat_ip" {
  vpc = true

  tags = {
    Purpose = var.purpose
    Owner = var.owner
  }
}

resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id = aws_subnet.subnet.id

  tags = {
    Subnet = aws_subnet.subnet.id
    VPC = var.vpc_id
    Purpose = var.purpose
    Owner = var.owner
  }
}
