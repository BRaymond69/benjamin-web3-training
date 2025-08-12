provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "monitoring_server" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name      = "my-key"

  tags = {
    Name = "IExecBenjamin"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker docker-compose",
    ]
  }
}