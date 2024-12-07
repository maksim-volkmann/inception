#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

# Read secrets from files
DB_NAME=$(cat /run/secrets/db_name)
DB_USER=$(cat /run/secrets/db_user)
DB_PASS=$(cat /run/secrets/db_password)
ADMIN_USER=$(cat /run/secrets/admin_user)
ADMIN_PASS=$(cat /run/secrets/admin_password)
ADMIN_EMAIL=$(cat /run/secrets/admin_email)

# Log variables for debugging
echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"
echo "DB_PASSWORD: $DB_PASSWORD"
echo "ADMIN_USER: $ADMIN_USER"
echo "ADMIN_PASS: $ADMIN_PASS"
echo "ADMIN_EMAIL: $ADMIN_EMAIL"
echo "DOMAIN_NAME: $DOMAIN_NAME"

# DOMAIN_NAME is set in the environment or provide a default
DOMAIN_NAME=${DOMAIN_NAME}

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=https://$DOMAIN_NAME --title=inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=admin@admin.com --allow-root
./wp-cli.phar option update siteurl "https://$DOMAIN_NAME" --allow-root
./wp-cli.phar option update home "https://$DOMAIN_NAME" --allow-root

# Explicitly create wp-content/uploads and set permissions
mkdir -p wp-content/uploads
chmod -R 0777 wp-content/uploads

php-fpm8.2 -F
