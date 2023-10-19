resource "aws_security_group" "allow-levelup-ssh" {
    name = "allow-levelup-ssh"
    description = "security group that allow ssh connect"
    vpc_id = aws_vpc.levelup_vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "allow-levelup-ssh"
    }
  
}