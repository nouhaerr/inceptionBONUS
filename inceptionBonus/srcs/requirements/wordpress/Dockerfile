FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install php-fpm php7.4-mysqlnd -y \
    && apt-get install curl -y

COPY conf/wp_config.sh /

RUN chmod +x wp_config.sh

CMD [ "./wp_config.sh" ]
