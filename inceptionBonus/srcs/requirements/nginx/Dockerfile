#From base image: debian
FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx openssl -y

COPY conf/file.conf /etc/nginx/conf.d

# COPY tools/file.html /var/www/html

COPY tools/script.sh /

RUN chmod +x script.sh

CMD ["./script.sh"]
