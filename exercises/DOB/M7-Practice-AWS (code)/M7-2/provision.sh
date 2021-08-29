#!/bin/bash
dnf install -y httpd
systemctl enable httpd
systemctl start httpd
echo '<h1>Hello from AWS CLI</h1>' > /var/www/html/index.html
