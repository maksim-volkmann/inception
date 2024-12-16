FROM debian:latest

RUN apt update && apt install -y \
    php-fpm \
    php-mysqli \
	redis \
	php-redis \
    curl \
    redis-tools  # Includes redis-cli

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY /tools/wordpress.sh .
RUN chmod +x wordpress.sh
CMD ["./wordpress.sh"]


# FROM debian:latest

# RUN apt update && apt install -y \
#     php-fpm \
#     php-mysqli \
# 	redis \
# 	php-redis \
#     curl \
#     redis-tools  # Includes redis-cli

# # WORKDIR /var/www/html

# RUN chown -R www-data:www-data /var/www/html

# COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
# COPY /tools/wordpress.sh .
# RUN chmod +x wordpress.sh
# CMD ["./wordpress.sh"]

# # CMD ["tail", "-f", "/dev/null"]
