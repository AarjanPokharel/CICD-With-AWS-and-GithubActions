
resource "aws_instance" "public-ec2" {
    ami = var.flask-ami 
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    availability_zone = "${var.region}a"
    vpc_security_group_ids = [aws_security_group.flaskapp-ec2.id, ]
    key_name = var.sshkey

    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y docker
                systemctl enable docker
                systemctl start docker
                usermod -aG docker ec2-user

                EOF

    tags = {
        "Name" = "flaskapp-ec2-instance"
    }
}
