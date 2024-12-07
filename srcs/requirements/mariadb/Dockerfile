FROM debian:stable

RUN apt update && apt install -y mariadb-server && apt clean

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD ["mysqld_safe"]
