resource "aws_instance" "ec2" {
    ami           = "ami-0b6d9d3d33ba97d99"
    instance_type = "t3.micro"
    key_name      = "my-key"
    count = 2
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo systemctl enable apache2
                echo "<h1>Welcome to my Web Server</h1>" | sudo tee /var/www/html/index.html
            EOF 
            root_block_device {
              volume_size = 8
              volume_type = "gp3"
            }
tags = {
        Name = "WebServer"
    }
          
}  