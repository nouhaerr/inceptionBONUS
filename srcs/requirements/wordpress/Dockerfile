FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install php-fpm php7.4-mysqlnd -y \
    && apt-get install php-redis -y\
    && apt-get install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
    
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php

COPY tools/wp_config.sh /

RUN chmod +x wp_config.sh

EXPOSE 9000

CMD [ "./wp_config.sh" ]
