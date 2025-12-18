#!/bin/bash
# Log user-data execution
exec > /var/log/user-data.log 2>&1

echo "===== Updating system ====="
yum update -y

echo "===== Installing required packages ====="
yum install -y httpd wget unzip

echo "===== Enabling and starting Apache ====="
systemctl enable httpd
systemctl start httpd

echo "===== Cleaning default web directory ====="
rm -rf /var/www/html/*

echo "===== Downloading Tooplate website ====="
cd /tmp
wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip

echo "===== Extracting website ====="
unzip 2134_gotto_job.zip

echo "===== Deploying website ====="
cp -r 2134_gotto_job/* /var/www/html/

echo "===== Setting permissions ====="
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/ht

