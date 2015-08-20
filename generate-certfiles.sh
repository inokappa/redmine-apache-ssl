#!/bin/sh

# Please set your environment.
 C=""
ST=""
 L=""
 O=""
OU=""
CN=""

# example
# C="JP"
#ST="Fukuoka"
# L="Fukuoka"
# O="foo"
#OU="bar"
#CN="foo.bar.example.com"

if [ -d assets/etc/apache2/ssl ];then
  rm -rf assets/etc/apache2/ssl
  mkdir -p assets/etc/apache2/ssl
else
  mkdir -p assets/etc/apache2/ssl
fi

openssl req \
   -x509 \
   -nodes \
   -subj "/C=${C}/ST=${ST}/L=${L}/O=${O}/OU=${OU}/CN=${CN}" \
   -days 365 \
   -newkey rsa:2048 \
   -keyout assets/etc/apache2/ssl/apache.key \
   -out assets/etc/apache2/ssl/apache.crt

openssl x509 \
   -in assets/etc/apache2/ssl/apache.crt \
   -outform DER \
   -out assets/etc/apache2/ssl/server.der
