#!/bin/bash
WEBSITE="https://www.tooplate.com/zip-templates/2146_nexus_brew.zip"
ZIP_FILE="$(basename "$WEBSITE")"
TMP="/tmp/${ZIP_FILE%.zip}"

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
rm -rf /tmp/*
rm -rf /var/www/html/*
sudo wget -P /tmp $WEBSITE
sudo unzip "/tmp/$ZIP_FILE" -d /tmp
sudo cp -r $TMP/* /var/www/html/

yum --help > /dev/null 2>&1
if [ $? -eq 0 ]; then

    sudo systemctl restart httpd
	sudo systemctl enable httpd
    sudo systemctl start httpd

else
	sudo systemctl restart apache2
    sudo systemctl enable apache2
    sudo systemctl start apache2

fi

