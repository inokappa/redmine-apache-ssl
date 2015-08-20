#!/bin/bash

sed -i "s/REDMINE_ADDR/${REDMINE_PORT_80_TCP_ADDR}/g" /etc/apache2/sites-available/redmine.conf
/usr/sbin/apache2 -D FOREGROUND
