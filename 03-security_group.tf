resource "aws_security_group" "webserver-sg" {
  name        = "webserver-sg"
  description = "allow inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "webserver-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-ssh" {
  description       = "ssh"
  security_group_id = aws_security_group.webserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-http" {
  description       = "http"
  security_group_id = aws_security_group.webserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-https" {
  description       = "https"
  security_group_id = aws_security_group.webserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443

  tags = {
    Name = "https"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-8080" {
  description       = "8080"
  security_group_id = aws_security_group.webserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080

  tags = {
    Name = "8080"
  }
}

######## Egress Rule ########

resource "aws_vpc_security_group_egress_rule" "sg-egress-allow-all-ipv4" {
  security_group_id = aws_security_group.webserver-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
