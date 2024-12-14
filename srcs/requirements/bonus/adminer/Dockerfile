FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        curl \
        php7.4-fpm \
        php7.4-mysqli \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Download Adminer
RUN mkdir -p /var/www/html && \
    curl -L -o /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Expose port 9001
EXPOSE 9001

# Command to start PHP-FPM
CMD ["php-fpm7.4", "--nodaemonize"]