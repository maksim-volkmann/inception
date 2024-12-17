FROM debian:stable

RUN apt-get update && apt-get install -y \
	redis \
	&& apt-get clean

COPY ./tools/redis.sh .

EXPOSE 6379
RUN chmod +x redis.sh
CMD ["./redis.sh"]
