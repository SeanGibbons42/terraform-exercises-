output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
    value = aws_internet_gateway.subnet_igw.id
}
