FROM nginx:latest

USER root
ADD ssl/Nginx.crt /etc/cert/Nginx.crt
ADD ssl/Nginx.key /etc/cert/Nginx.key
chown nginx:nginx /etc/cert/Nginx.*
chmod 700 /etc/cert/Nginx.*

ADD data/* /etc/nginx/

USER nginx
