FROM debian:stable

RUN apt update && \
	apt install -y nginx && \
	apt clean

# Copy custom NGINX config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy index.html into the web root
COPY ./index.html /var/www/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
