FROM debian:bullseye

RUN	apt-get update -y && apt-get install redis -y

COPY ./tools/redis.sh /tmp/redis.sh

EXPOSE 6379

CMD ["sh", "/tmp/redis.sh"]