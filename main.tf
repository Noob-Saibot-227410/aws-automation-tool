resource "aws_instance" "ubuntu" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "ubuntu-aws-automation-tool"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt -y install apache2 php libapache2-mod-php php-mysql",
      "sudo ufw allow 'Apache'"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_security_group" "aws_automation_tool" {
  name_prefix = "sg-aws-automation-tool-"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      var.ssh_cidr_block
    ]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "${self.ipv4_cidr_block}"
    ]
  }
}

resource "aws_vpc" "aws_automation_tool" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-aws-automation-tool"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.aws_automation_tool.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-a-aws-automation-tool"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id     = aws_vpc.aws_automation_tool.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-b-aws-automation-tool"
  }
}

output "instance_ip" {
  value = aws_instance.ubuntu.public_ip
}
