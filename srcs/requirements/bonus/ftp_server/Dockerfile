FROM debian:bullseye

RUN apt-get update -y && apt-get install vsftpd -y

RUN mkdir -p /var/run/vsftpd/empty && chmod 755 /var/run/vsftpd/empty

COPY conf/vsftpd.conf /tmp/vsftpd.conf
COPY tools/ftp.sh /tmp/ftp.sh

ENTRYPOINT [ "sh", "/tmp/ftp.sh" ]