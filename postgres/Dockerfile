# FROM postgres:latest
FROM postgres:13
ENV POSTGRES_PASSWORD password
ENV POSTGRES_USER postgres
ENV POSTGRES_DB evesde

COPY postgres-schema-latest.dmp .
COPY init.sh /docker-entrypoint-initdb.d/
COPY create_role.sql /docker-entrypoint-initdb.d/
