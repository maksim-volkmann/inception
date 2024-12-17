FROM debian:stable

# Install packages
RUN apt-get update && apt-get install -y \
	mariadb-server \
	&& apt-get clean


# Copy custom config file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to the main directory
COPY tools/mariadb.sh /mariadb.sh
RUN chmod +x /mariadb.sh

# Prepare run directory and set ownership
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

EXPOSE 3306

ENTRYPOINT ["/mariadb.sh"]
