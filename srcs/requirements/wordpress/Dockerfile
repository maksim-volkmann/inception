
FROM debian:latest

RUN apt update && apt install -y \
	php-fpm \
	php-mysqli \
	curl

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY /tools/wordpress.sh .
RUN chmod +x wordpress.sh
CMD ["./wordpress.sh"]
