# Create VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "MyGitHubActionsVPC"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.example_vpc.id

  tags = {
    Name = "MyIGW"
  }
}

# Create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "MyPublicSubnet"
  }
}

# Create route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "MyPublicRouteTable"
  }
}

# Associate subnet with route table
resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
