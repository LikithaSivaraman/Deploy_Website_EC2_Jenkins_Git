# vpc cidr
resource "aws_vpc" "vpc01" {
   cidr_block = "172.100.0.0/16"
     
     tags = {
    Name = "${var.tag}-VPC01"
    Managed_by = "${var.Managed_by}"
  }
}
#Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc01.id

  tags = {
    Name = "${var.tag}-gw01"
    
  }
}
# public subnet
resource "aws_subnet" "pub-sub01" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "172.100.1.0/24"

  tags = {
    Name = "Public-sub01"
    Managed_by ="${var.Managed_by}"
  }
}
# private subnet
resource "aws_subnet" "pri-sub01" {
  vpc_id     = aws_vpc.vpc01.id
  cidr_block = "172.100.2.0/24"

  tags = {
    Name = "Private-sub01"
  }
}
# Route table
resource "aws_route_table" "rt-01" {
  vpc_id = aws_vpc.vpc01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.tag}-RT-01"
  }
}
resource "aws_route_table_association" "pub-sub-association" {
  subnet_id      = aws_subnet.pub-sub01.id
  route_table_id = aws_route_table.rt-01.id
}

resource "aws_security_group" "SG01" {
 
  description = "Ingress and egress rules defined.."
  vpc_id      = aws_vpc.vpc01.id

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {

   from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ingress {

  cidr_blocks = [aws_vpc.vpc01.cidr_block, "49.47.219.226/32"]
  from_port   = 80
  protocol = "tcp"
  to_port     = 80
}

  tags = {
    Name = "SG-01"
  }
}


# EC2 -Web1
resource "aws_instance" "Web01" {
  ami           = var.ami
  instance_type = "t3.micro"
  key_name = "Ikey"
  subnet_id = aws_subnet.pub-sub01.id
  associate_public_ip_address = "true"
  security_groups = [aws_security_group.SG01.id]



  tags = {
    Name = "Web01"
  }
}

output "aws_instance_public_ip" {
    value = aws_instance.Web01.public_ip
  
}
