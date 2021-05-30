FROM mariadb:latest

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
ADD init.sql //docker-entrypoint-initdb.d/init.sql