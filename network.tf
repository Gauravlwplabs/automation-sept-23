resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    Name = local.vpc_name_local
  }
}

resource "aws_subnet" "public_subnet" {
  for_each                = { for index, each_az in slice(data.aws_availability_zones.this.names, 0, var.num_of_subnets / 2) : index => each_az } # {0:"us-east-1a",1:"us-east-1b"}
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, local.newbits, each.key)
  map_public_ip_on_launch = true
  availability_zone       = each.value
  tags = {
    Name = "public_subnet${each.key}-${local.vpc_name_local}"
  }
}

resource "aws_subnet" "pri_sub" {
  for_each   = { for index, each_az in slice(data.aws_availability_zones.this.names, 0, var.num_of_subnets / 2) : index => each_az }
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.vpc_cidr, local.newbits, each.key + var.num_of_subnets / 2)

  tags = {
    Name = "private_subnet${each.key}-${local.vpc_name_local}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${local.vpc_name_local}-public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${local.vpc_name_local}-private-rt"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.vpc_name_local}-igw"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "${local.vpc_name_local}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "main" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.main]
}

# dependencies in terraform 

# implicit dependencies
# explicit dependencies