provider "aws" {
  region = "us-east-1" # Change to your AWS region
  access_key = var.access_key
  secret_key = var.secret_key
  token = var.session_token
}

variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret key"
}

variable "session_token" {
  description = "AWS session token"
}

resource "aws_vpc" "project1" {
  cidr_block = "10.0.0.0/16" # Change this to your required CIDR block
  tags = {
    Name = "project1"
  }
}

resource "aws_internet_gateway" "project1" {
  vpc_id = aws_vpc.project1.id
}

resource "aws_route_table" "project1" {
  vpc_id = aws_vpc.project1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project1.id
  }

  tags = {
    Name = "project1"
  }
}

resource "aws_main_route_table_association" "project1" {
  vpc_id         = aws_vpc.project1.id
  route_table_id = aws_route_table.project1.id
}
