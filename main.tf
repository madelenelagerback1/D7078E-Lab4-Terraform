
resource "aws_security_group" "lab_sg" {
  name        = "lab-sg"
  description = "Allow SSH"
  vpc_id      = "vpc-0e773d5d243e2af90"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["95.61.57.38/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "lab_ec2" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.lab_sg.id]

  tags = {
    Name = "terraform-lab-ec2"
  }
}



resource "aws_s3_bucket" "lab_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "terraform-lab-bucket"
  }
}
