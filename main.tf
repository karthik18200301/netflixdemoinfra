provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-02b8269d5e85954ef"
  instance_type          = "t3.medium"
  key_name               = "SSS"
  vpc_security_group_ids = ["sg-027bb845ecfe37fa7"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}
