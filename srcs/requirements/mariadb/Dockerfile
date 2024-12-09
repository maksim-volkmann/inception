FROM debian:stable

# Install necessary packages
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

# Copy custom config file
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Prepare run directory and set ownership
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
