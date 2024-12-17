FROM debian:stable

# Install Redis
RUN apt-get update && apt-get install -y \
	redis \
	&& apt-get clean

# Copy conf and script to container
COPY ./conf/redis.conf /etc/redis/redis.conf
COPY ./tools/redis.sh .
RUN chmod +x redis.sh

# Port
EXPOSE 6379

ENTRYPOINT ["./redis.sh"]
