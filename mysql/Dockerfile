# FROM mysql:latest
FROM mysql:5.7
# ENV POSTGRES_PASSWORD password
# ENV POSTGRES_USER postgres
# ENV POSTGRES_DB evesde
ENV MYSQL_DATABASE evesde
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_USER mysql
ENV MYSQL_PASSWORD password

COPY *.sql /docker-entrypoint-initdb.d/

# COPY postgres-schema-latest.dmp .
# COPY init.sh /docker-entrypoint-initdb.d/
# COPY create_role.sql /docker-entrypoint-initdb.d/
