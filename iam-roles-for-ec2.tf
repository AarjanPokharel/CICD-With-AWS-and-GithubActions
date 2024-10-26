# Creating iam role for ec2

resource "aws_iam_role" "for-ec2" {
  name = "ec2-flaskapp"
  assume_role_policy = jsonencode({
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid = ""
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-flaskapp-profile"
  role = aws_iam_role.for-ec2.name
}


resource "aws_iam_role_policy_attachment" "bastion" {
  role = aws_iam_role.for-ec2.name
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
}