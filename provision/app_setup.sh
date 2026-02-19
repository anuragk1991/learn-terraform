#!/bin/bash
set -euxo pipefail

echo "Running app_setup.sh at $(date)" | tee -a /var/log/app_setup.log

# Install Apache + PHP (Amazon Linux 2 style)
yum update -y
yum install -y httpd php php-cli

# Apache document root
APP_DIR="/var/www/html"

# Clean any existing files
rm -rf "${APP_DIR:?}"/*

# Repo root where your app lives
REPO_ROOT="/opt/demo-app"

if [ ! -d "${REPO_ROOT}/public" ]; then
  echo "ERROR: ${REPO_ROOT}/public does not exist. Did you clone the repo to ${REPO_ROOT}?" >&2
  exit 1
fi

# Copy public PHP files into document root
cp -r "${REPO_ROOT}/public/"* "$APP_DIR/"

# Ownership & permissions
chown -R apache:apache "$APP_DIR"
chmod -R 755 "$APP_DIR"

# Enable & restart Apache
systemctl enable httpd
systemctl restart httpd

echo "app_setup.sh completed successfully." | tee -a /var/log/app_setup.log
