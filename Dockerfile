#
FROM debian:jessie
#
MAINTAINER YOHEI KAWAHARA inokappa
#
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install apache2 vim curl
#
ADD ./assets/etc/apache2/ssl/apache.crt /etc/apache2/ssl/apache.crt 
ADD ./assets/etc/apache2/ssl/apache.key /etc/apache2/ssl/apache.key
ADD ./assets/etc/apache2/sites-available/redmine.conf /etc/apache2/sites-available/redmine.conf
ADD ./assets/start.sh /start.sh
#
RUN \
  chmod 755 /start.sh
#
RUN \
  mkdir /var/lock/apache2 && \
  chown -R www-data:root /var/log/apache2
#
RUN \
  /usr/sbin/a2enmod ssl && \
  /usr/sbin/a2enmod proxy && \
  /usr/sbin/a2enmod proxy_http && \
  /usr/sbin/a2dissite 000-default.conf && \
  /usr/sbin/a2ensite redmine.conf
#
EXPOSE 80 443
ENV APACHE_RUN_USER    www-data
ENV APACHE_RUN_GROUP   www-data
ENV APACHE_PID_FILE    /var/run/apache2.pid
ENV APACHE_RUN_DIR     /var/run/apache2
ENV APACHE_LOCK_DIR    /var/lock/apache2
ENV APACHE_LOG_DIR     /var/log/apache2
ENV LANG               C
CMD ["/start.sh"]
