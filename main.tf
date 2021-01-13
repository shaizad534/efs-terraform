provider "aws" {
  region = var.region
}

# Creating EFS File system

resource "aws_efs_file_system" "my-efs" {
  creation_token   = var.creation_token
  performance_mode = "generalPurpose"
  tags = {
    Name = var.Env
  }
}

# mounting Efs File system.

resource "aws_efs_mount_target" "mount" {
  file_system_id  = aws_efs_file_system.my-efs.id
  subnet_id       = var.subnetid
  security_groups = [aws_security_group.efs-sg.id]
}

# Adding Security Group for our Instance :

resource "aws_security_group" "efs-sg" {
  name       ="Efs-sg"
  description = "This security group is used by Efs"
  vpc_id      = var.vpcid

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.PvtIp]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
