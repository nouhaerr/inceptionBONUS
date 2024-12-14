FROM debian:bullseye

RUN	apt-get update -y && apt-get install redis -y

COPY ./tools/redis.sh /tmp/redis.sh

RUN chmod +x /tmp/redis.sh

CMD ["./tmp/redis.sh"]