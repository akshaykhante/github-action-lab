resource "aws_vpc" "test_vpc_ak" {
  cidr_block = "10.30.0.0/16"
  tags = {"Name" = "test_vpc_ak"}
}

resource "aws_subnet" "test_subnet_ak" {
  vpc_id = aws_vpc.test_vpc_ak.id
  for_each = toset(data.aws_availability_zones.us_east_1_azs.names)
  cidr_block = lookup(var.cidr_blocks_subnet, each.value)
  tags = { "Name" = format("ak-subnet-%s",each.value)}
}