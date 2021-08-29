data "aws_availability_zones" "available" {}

# Main  vpc
resource "aws_vpc" "main" {
  cidr_block       = "${var.VPC_CIDR_BLOCK}"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.PROJECT_NAME}-vpc"
  }
}

# Public subnets

#public Subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.VPC_PUBLIC_SUBNET1_CIDR_BLOCK}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.PROJECT_NAME}-vpc-public-subnet-1"
  }
}
#public Subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.VPC_PUBLIC_SUBNET2_CIDR_BLOCK}"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.PROJECT_NAME}-vpc-public-subnet-2"
  }
}


# internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "${var.PROJECT_NAME}-vpc-internet-gateway"
  }
}


# Route Table for public Architecture

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.PROJECT_NAME}-public-route-table"
  }
}


# Route Table association with public subnets
resource "aws_route_table_association" "to_public_subnet1" {
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public.id}"
}
resource "aws_route_table_association" "to_public_subnet2" {
  subnet_id      = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

