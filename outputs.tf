output "vpc_id" {
  value = aws_vpc.aws_automation_tool.id
}

output "subnet_a_id" {
  value = aws_subnet.subnet_a.id
}

output "subnet_b_id" {
  value = aws_subnet.subnet_b.id
}

output "security_group_id" {
  value = aws_security_group.aws_automation_tool.id
}

output "instance_public_ip" {
  value = aws_instance.ubuntu.public_ip
}
