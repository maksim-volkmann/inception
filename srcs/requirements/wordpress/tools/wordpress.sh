#!/bin/bash
set -e

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

# SECRETS
DB_NAME=$(cat /run/secrets/db_name)
DB_USER=$(cat /run/secrets/db_user)
DB_PASS=$(cat /run/secrets/db_pass)
ADMIN_USER=$(cat /run/secrets/admin_user)
ADMIN_PASS=$(cat /run/secrets/admin_pass)
ADMIN_EMAIL=$(cat /run/secrets/admin_email)

DOMAIN_NAME=${DOMAIN_NAME}

# Check if WordPress is already installed (if wp-config.php exists)
if [ ! -f "wp-config.php" ]; then
	echo "WordPress not found. Installing..."
	./wp-cli.phar core download --allow-root
	./wp-cli.phar config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=mariadb --allow-root
	./wp-cli.phar core install --url="https://$DOMAIN_NAME" --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root
	./wp-cli.phar option update siteurl "https://$DOMAIN_NAME" --allow-root
	./wp-cli.phar option update home "https://$DOMAIN_NAME" --allow-root

	# Explicitly create wp-content/uploads and set permissions
	mkdir -p wp-content/uploads
	chmod -R 0777 wp-content/uploads
else
	echo "WordPress already configured, skipping installation."
fi

# Start PHP-FPM
php-fpm8.2 -F
