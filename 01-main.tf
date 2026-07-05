resource "aws_instance" "main_control_server" {
  ami                    = "ami-0741dc526e1106ae5"
  instance_type          = "t2.micro"
  key_name               = "ec2-lab-app"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]

  tags = {
    Name = "main_control_server"
  }
}

resource "aws_instance" "web_servers" {
  count                  = 2
  ami                    = "ami-0741dc526e1106ae5" # Your Amazon Linux AMI
  instance_type          = "t2.micro"
  key_name               = "ec2-lab-app"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]

  tags = {
    Name = "web-server-${count.index + 1}"
  }
}