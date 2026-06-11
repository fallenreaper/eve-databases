FROM mysql:5.7
ENV MYSQL_DATABASE evesde
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_USER mysql
ENV MYSQL_PASSWORD password

RUN yum install -y bzip2 curl
RUN curl -k -o latest-mysql.sql.gz https://www.fuzzwork.co.uk/dump/latest-mysql.sql.gz \
    && gunzip latest-mysql.sql.gz \
    && mv latest-mysql.sql /docker-entrypoint-initdb.d/ 

EXPOSE 3306
