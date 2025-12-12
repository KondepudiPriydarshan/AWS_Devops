#!/bin/bash

sudo rm -rf /var/www/html/*
echo "Let's deploy a website on this VM"
echo

# Ask for URL
read -p "Paste the website URL here: " URL
echo

# Extract ZIP name from URL
FILENAME=$(basename "$URL")        # e.g., 2151_winter_gallery.zip
ARTIFACT="${FILENAME%.zip}"        # e.g., 2151_winter_gallery

cd /tmp

# Download
wget -q "$URL"
if [ $? -ne 0 ]; then
    echo "❌ Download failed. Please check the URL."
    exit 1
fi

# Unzip
unzip -o "$FILENAME" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Unzip failed. File may not be a valid ZIP."
    exit 1
fi

# Move files
sudo mv "$ARTIFACT"/* /var/www/html/ 2>/dev/null
sudo systemctl restart httpd

# ✔ SUCCESS CHECK — Does directory contain files?
if [ "$(ls -A /var/www/html/)" ]; then
    echo "✅ Deployment Successful!"
else
    echo "❌ Deployment Failed — /var/www/html is empty."
    exit 1
fi

# Cleanup
sudo rm -rf "/tmp/$ARTIFACT"
sudo rm -f "/tmp/$FILENAME"

