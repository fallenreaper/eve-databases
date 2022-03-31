# FROM postgres:latest
FROM postgres:13
ENV POSTGRES_PASSWORD password
ENV POSTGRES_USER postgres
ENV POSTGRES_DB evesde

RUN apt-get update
RUN apt-get install -y curl

RUN curl -k -o postgres-schema-latest.dmp.bz2 https://www.fuzzwork.co.uk/dump/postgres-schema-latest.dmp.bz2
RUN bzip2 -d postgres-schema-latest.dmp.bz2
RUN rm postgres-schema-latest.dmp.bz2

COPY postgres-schema-latest.dmp .
COPY init.sh /docker-entrypoint-initdb.d/
COPY create_role.sql /docker-entrypoint-initdb.d/
