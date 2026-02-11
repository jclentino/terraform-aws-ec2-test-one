provider "aws" {
  region = var.region
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Servidor Nginx con Terraform 🚀</h1>" > /usr/share/nginx/html/index.html
              EOF

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "ec2-nginx-module"
  }
}