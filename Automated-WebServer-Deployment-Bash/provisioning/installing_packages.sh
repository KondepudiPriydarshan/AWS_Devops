#!/bin/bash

# Try yum --help to detect CentOS/RHEL
yum --help > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Installing packages on CentOS..."
    sudo yum install -y wget unzip vim httpd

    sudo systemctl enable httpd
    sudo systemctl start httpd

    echo "CentOS ready to host Website"
else
    echo "Installing packages on Ubuntu..."
    sudo apt update -y
    sudo apt install -y wget unzip vim apache2

    sudo systemctl enable apache2
    sudo systemctl start apache2

    echo "Ubuntu ready to host Website"
fi


