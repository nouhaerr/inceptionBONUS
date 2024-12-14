#!/bin/bash

cd /var/www/html/
# remove existing files from volume if there are any to install it again
# rm -rf /var/www/html/*

# Download the WordPress core files
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
wp core install --url=$URL --title=$TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=subscriber --user_pass=$WP_USER_PASS --allow-root


#Redis
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

wp redis enable --allow-root

exec php-fpm7.4 -F
