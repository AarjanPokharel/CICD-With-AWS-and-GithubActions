
variable "flask-ami" {
    default = "ami-06b21ccaeff8cd686"
}

variable "vpc_cidrblock" {
    default = "172.21.0.0/20"
}

variable "subnet_cidr" {
    type=list(string)
    default = ["172.21.0.0/28","172.21.0.16/28"]
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "sshkey" {
    type = string
    description = "Private SSH key to access the server"
}
