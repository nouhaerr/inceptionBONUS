#!/bin/bash

cd /var/www/html/
# remove existing files from volume if there are any to install it again
# rm -rf /var/www/html/*

# Download the WordPress core files
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
wp core install --url=$URL --title=$TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=subscriber --user_pass=$WP_USER_PASS --allow-root
wp theme activate twentytwentyfour --allow-root

wp --allow-root config set FS_METHOD "'direct'" --raw
wp --allow-root config set FTP_HOST "'ftp-server'" --raw
wp --allow-root config set FTP_USER "'$FTP_USR'" --raw
wp --allow-root config set FTP_PASS "'$FTP_PWD'" --raw
wp --allow-root config set FTP_SSL "false" --raw
wp --allow-root config set FTP_PUBKEY "''" --raw
wp --allow-root config set FTP_PRIKEY "''" --raw
wp --allow-root config set FTP_PASSIVE_MODE "true" --raw

chown -R www-data:www-data /var/www/html/wp-content
chmod -R 755 /var/www/html/wp-content

#Redis
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp config set WP_REDIS_CLIENT phpredis --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

wp redis enable --allow-root
# redis-cli KEYS *

exec php-fpm7.4 -F
