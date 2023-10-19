resource "aws_vpc" "levelup_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    

    tags = {
      Name = "main"
    }
  
}

resource "aws_subnet" "levelupvpc-public-1" {
    vpc_id = aws_vpc.levelup_vpc.id
    cidr_block = "10.0.1.0/24"

    availability_zone = "ap-south-1a"

    tags = {
      Name = "levelupvpc-public-1"
    }
  
}


resource "aws_subnet" "levelupvpc-public-2" {
    vpc_id = aws_vpc.levelup_vpc.id
    cidr_block = "10.0.2.0/24"

    availability_zone = "ap-south-1b"

    tags = {
      Name = "levelupvpc-public-2"
    }
  
}

resource "aws_subnet" "levelupvpc-public-3" {
    vpc_id = aws_vpc.levelup_vpc.id
    cidr_block = "10.0.3.0/24"

    availability_zone = "ap-south-1c"

    tags = {
      Name = "levelupvpc-public-3"
    }
  
}


# this private subnet
resource "aws_subnet" "levelupvpc-private-1" {
    vpc_id = aws_vpc.levelup_vpc.id
    cidr_block = "10.0.4.0/24"

    availability_zone = "ap-south-1a"
map_public_ip_on_launch = "false"
    tags = {
      Name = "levelupvpc-private-1"
    }
  
}


resource "aws_subnet" "levelupvpc-private-2" {
    vpc_id = aws_vpc.levelup_vpc.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"

    availability_zone = "ap-south-1b"

    tags = {
      Name = "levelupvpc-private-2"
    }
  
}

resource "aws_subnet" "levelupvpc-private-3" {
    vpc_id = aws_vpc.levelup_vpc.id
    cidr_block = "10.0.6.0/24"
map_public_ip_on_launch = "false"
    availability_zone = "ap-south-1c"

    tags = {
      Name = "levelupvpc-private-3"
    }
  
}

# Custom internet Gate way
resource "aws_internet_gateway" "levelup-gw" {
    vpc_id = aws_vpc.levelup_vpc.id
    tags = {
      Name = "levelup-gw"

    }
  
}

# Route Table of custom vpc
resource "aws_route_table" "levelup-public" {
    vpc_id = aws_vpc.levelup_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.levelup-gw.id

    }
    tags = {
      Name = "levelupvpc-public-1"
    }
  
}
# public route table associate
resource "aws_route_table_association" "levelup-public-1-a" {
    subnet_id = aws_subnet.levelupvpc-public-1.id
    route_table_id = aws_route_table.levelup-public.id
  
}


resource "aws_route_table_association" "levelup-public-1-b" {
    subnet_id = aws_subnet.levelupvpc-public-2.id
    route_table_id = aws_route_table.levelup-public.id
  
}



resource "aws_route_table_association" "levelup-public-1-c" {
    subnet_id = aws_subnet.levelupvpc-public-3.id
    route_table_id = aws_route_table.levelup-public.id
  
}

