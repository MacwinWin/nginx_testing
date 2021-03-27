#!/bin/bash

cp /app/2021-03-25/nginx_server.conf /etc/nginx/sites-available/default
cp /app/2021-03-25/nginx.conf /etc/nginx

supervisorctl -c /app/supervisord.conf reload
sleep 5

/root/go-stress-testing-linux -c 7 -n 2 -H 'X-Signature: 123' -H 'X-DeliverId: 123' -u 'http://127.0.0.1:8964/pid/1/production_page'