output "server_details" {
  value = {
    control_server_url = "http://${aws_instance.main_control_server.public_dns}"
    control_server_ip  = aws_instance.main_control_server.public_ip
  }
}

output "web_server_ips" {
  value = aws_instance.web_servers[*].public_ip
}