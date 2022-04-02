# FROM mysql:latest
FROM mysql:5.7
ENV MYSQL_DATABASE evesde
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_USER mysql
ENV MYSQL_PASSWORD password

RUN apt-get update \
    && apt-get install -y bzip2 curl
RUN curl -k -o mysql-latest.tar.bz2 https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2 \
    && bzip2 -d mysql-latest.tar.bz2 \
    && tar -xvf mysql-latest.tar \
    && mv sde*/*.sql /docker-entrypoint-initdb.d/ \
    && rm -rf sde* *.tar

EXPOSE 3306
