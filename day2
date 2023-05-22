resource "aws_vpc" "project2" {
  cidr_block = "172.16.0.0/16" # Change this to your required CIDR block
  tags = {
    Name = "project2"
  }
}

resource "aws_internet_gateway" "project2" {
  vpc_id = aws_vpc.project2.id
}

resource "aws_route_table" "project2" {
  vpc_id = aws_vpc.project2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project2.id
  }

  tags = {
    Name = "project2"
  }
}

resource "aws_main_route_table_association" "project2" {
  vpc_id         = aws_vpc.project2.id
  route_table_id = aws_route_table.project2.id
}
