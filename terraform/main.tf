# Recupera l'ultimo AMI ID di Ubuntu 24.04 LTS tramite SSM Parameter Store
data "aws_ssm_parameter" "ubuntu_latest" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

# Usa l'ID dinamico per creare il server
resource "aws_instance" "web_server" {
  ami           = data.aws_ssm_parameter.ubuntu_latest.value
  instance_type = "t3.micro"

  tags = {
    Name = "Ubuntu-Latest-Server"
  }
}

