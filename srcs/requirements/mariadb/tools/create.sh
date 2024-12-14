#!/bin/bash

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME ;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;"
mariadb -e "FLUSH PRIVILEGES;"

# mariadb : command-line client for MariaDB. It provides a way to execute SQL queries, manage databases, users, and perform various administrative tasks. 
# -e : stands for "execute." It allows you to specify a single SQL statement to be executed by MariaDB immediately after connecting.

service mariadb stop

# sleep 5

# Using mysqld_safe is a common practice in Docker containers 
# to ensure that the MariaDB server starts reliably and remains running within the container environment,
# providing a stable database service for applications running inside the container.
mysqld_safe