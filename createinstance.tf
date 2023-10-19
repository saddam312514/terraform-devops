
resource "aws_key_pair" "levelup_key" {
  key_name = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  
}

resource "aws_instance" "myfirstinstace" {
    ami = "ami-08e5424edfe926b43"
    instance_type = "t2.micro"
    key_name = aws_key_pair.levelup_key.key_name
    vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
    subnet_id = aws_subnet.levelupvpc-public-1.id
    associate_public_ip_address = true
    
    
    tags = {
      Name = "terraform-demo"
    }

}

resource "aws_instance" "private-instance" {
    ami = "ami-08e5424edfe926b43"
    instance_type = "t2.micro"
    key_name = aws_key_pair.levelup_key.key_name
    vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
    subnet_id = aws_subnet.levelupvpc-private-1.id
    associate_public_ip_address = false
    
    
    tags = {
      Name = "private-instance"
    }

}


