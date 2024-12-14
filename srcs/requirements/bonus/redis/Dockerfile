FROM debian:bullseye

RUN	apt-get update -y && apt-get install redis -y

RUN chmod -R 755 /etc/redis /var/lib/redis

COPY ./tools/redis.sh /tmp/redis.sh

RUN chmod +x /tmp/redis.sh

CMD ["sh", "/tmp/redis.sh"]