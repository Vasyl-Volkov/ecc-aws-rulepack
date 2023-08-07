resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = "329_key_pair_red"
  public_key = tls_private_key.this.public_key_openssh
}

