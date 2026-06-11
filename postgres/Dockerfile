FROM postgres:13
ENV POSTGRES_PASSWORD password
ENV POSTGRES_USER postgres
ENV POSTGRES_DB evesde

RUN apt-get update
RUN apt-get install -y curl bzip2

RUN curl -k -o latest-postgresschema.pgdump https://www.fuzzwork.co.uk/dump/latest-postgresschema.pgdump

COPY init.sh /docker-entrypoint-initdb.d/
COPY create_role.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
