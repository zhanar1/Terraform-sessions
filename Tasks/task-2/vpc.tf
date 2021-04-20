### VPC ###
resource "aws_vpc" "vpc_2" {
  cidr_block = var.vpc_cidr_block
tags = {
    Name = "${var.env}-vpc"
    Enviroment =  var.env 
    Project = var.project_name 
}
}
###   Internet  Gateway ####
 resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_2.id
 tags =  {
    Name = "${var.env}-internet_gateway"
    Enviroment =  var.env 
    Project = var.project_name 
   }
}
### Public RouteTable ###
resource "aws_route_table" "public_route_table"{
  vpc_id = aws_vpc.vpc_2.id

  route  {
    cidr_block = var.open_cidr_block
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.env}-public_route_table"
    Enviroment = var.env 
      Project = var.project_name 
  
  }
}
###  Public Subnets - 3 ####
#1#
resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.vpc_2.id
  cidr_block = var.public-subnet-1

 tags = {
    Name = "${var.env}-public-subnet-1"
    Enviroment = var.env 
    Project = var.project_name 
  }
}
#2#
resource "aws_subnet" "public-subnet-2" {
  vpc_id = aws_vpc.vpc_2.id
  cidr_block = var.public-subnet-2

 tags = {
    Name = "${var.env}-public-subnet-2"
    Enviroment = var.env 
    Project = var.project_name 
  }
}
#3#
resource "aws_subnet" "public-subnet-3" {
  vpc_id = aws_vpc.vpc_2.id
  cidr_block = var.public-subnet-3

 tags = {
    Name = "${var.env}-public-subnet-3"
    Enviroment = var.env 
    Project = var.project_name 
  }
}

### Associate the subnets to “Public-RouteTable ### 
#1#
resource  "aws_route_table_association" "public-subnet-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public_route_table.id
}
#2#
resource  "aws_route_table_association" "public-subnet-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public_route_table.id
}
#3#
resource  "aws_route_table_association" "public-subnet-3" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.public_route_table.id
}

### Elastic IP ### 
resource "aws_eip" "elastic_ip_for_NatG" {
  vpc      = true
   
   tags = {
    Name = "${var.env}-eip"
    Enviroment = var.env 
    Project = var.project_name 
  }
}

### Nat Gateway ### 
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip_for_NatG.id
  subnet_id     = aws_subnet.private-subnet-3.id

 tags = {
    Name = "${var.env}-nat-gateway"
    Enviroment = var.env 
    Project = var.project_name 
}
}
 ### Pirvate Route Table with nat gateway ### 
 resource "aws_route_table" "private_route_table"{
  vpc_id = aws_vpc.vpc_2.id

  route  {
    cidr_block = var.open_cidr_block
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${var.env}-private_route_table"
    Enviroment = var.env 
      Project = var.project_name 
  
  }
}
###  Private Subnets - 3 ####
#1#
resource "aws_subnet" "private-subnet-1" {
  vpc_id = aws_vpc.vpc_2.id
  cidr_block = var.private-subnet-1

 tags = {
    Name = "${var.env}-private-subnet-1"
    Enviroment = var.env 
    Project = var.project_name 
  }
}
#2#
resource "aws_subnet" "private-subnet-2" {
  vpc_id = aws_vpc.vpc_2.id
  cidr_block = var.private-subnet-2

 tags = {
    Name = "${var.env}-private-subnet-2"
    Enviroment = var.env 
    Project = var.project_name 
  }
}
#3#
resource "aws_subnet" "private-subnet-3" {
  vpc_id = aws_vpc.vpc_2.id
  cidr_block = var.private-subnet-3

 tags = {
    Name = "${var.env}-private-subnet-3"
    Enviroment = var.env 
    Project = var.project_name 
  }
}
### Associate the subnets to “Private-RouteTable ### 
#1#
resource  "aws_route_table_association" "private-subnet-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private_route_table.id
}
#2#
resource  "aws_route_table_association" "private-subnet-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private_route_table.id
}
#3#
resource  "aws_route_table_association" "private-subnet-3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private_route_table.id
}