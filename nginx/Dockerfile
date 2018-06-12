FROM nginx:latest

USER root
ADD ssl/Nginx.crt /etc/cert/Nginx.crt
ADD ssl/Nginx.key /etc/cert/Nginx.key
RUN chown nginx:nginx /etc/cert/Nginx.*
RUN chmod 700 /etc/cert/Nginx.*

ADD data/* /etc/nginx/

USER nginx
