resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"
  tags = {
   Name = "Instance-2"
  }
}