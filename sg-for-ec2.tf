#security group

resource "aws_security_group" "flaskapp-ec2" {
    description = "allow ssh on ec2"
    name = "flaskapp-ec2"
    vpc_id = aws_vpc.main.id

    ingress = {
        protocol = "tcp"
        from_port = [22,80]
        to_port = [22,80]
        cidr_blocks = ["0.0.0.0/0"]
    }
}


   