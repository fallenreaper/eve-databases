# FROM mysql:latest
FROM mysql:5.7
# ENV POSTGRES_PASSWORD password
# ENV POSTGRES_USER postgres
# ENV POSTGRES_DB evesde
ENV MYSQL_DATABASE evesde
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_USER mysql
ENV MYSQL_PASSWORD password

RUN apt-get update
RUN apt-get install -y bzip2 curl
RUN curl -k -o mysql-latest.tar.bz2 https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2
RUN bzip2 -d mysql-latest.tar.bz2
RUN tar -xvf mysql-latest.tar
RUN mv sde*/*.sql /docker-entrypoint-initdb.d/
RUN rm -rf sde* *.tar

EXPOSE 3306
