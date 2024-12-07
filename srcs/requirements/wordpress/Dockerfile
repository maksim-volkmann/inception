FROM debian:stable

RUN apt update && \
	apt install -y php-fpm && \
	apt clean

CMD ["php-fpm8.2", "-F"]
