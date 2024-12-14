#!/bin/bash

sleep 5

sed -i \
    -e "s|DOMAIN_NAME|$DOMAIN_NAME|g" \
    -e "s|CERTS_CRT|$CERTS_CRT|g" \
    -e "s|CERTS_KEY|$CERTS_KEY|g" \
    /etc/nginx/conf.d/file.conf

# Generate the certificate with OpenSSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${CERTS_KEY} -out ${CERTS_CRT} \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORGANIZATION}/OU=${ORG_UNIT}/CN=${COMMON_NAME}/emailAddress=${EMAIL}"

# Start NGINX in the foreground as the main process
nginx -g 'daemon off;'
