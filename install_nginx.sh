#!/bin/bash

dnf update -y
dnf install -y nginx

systemctl enable --now nginx

echo "<h1>Terraform learning page</h1>" > /usr/share/nginx/html/index.html