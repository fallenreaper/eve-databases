FROM mcr.microsoft.com/mssql/server:2017-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Password123!
ENV MSSQL_PID=Developer
ENV DBNAME=evesde

EXPOSE 1433

RUN apt-get update \
    && apt-get install unzip -y
RUN wget -progress=bar:force -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2165213 \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage

RUN wget -progress=bar:force -q -O /mssql-latest.bacpac https://www.fuzzwork.co.uk/dump/mssql-latest.bacpac

# RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
#     && /opt/sqlpackage/sqlpackage /a:Import /tsn:. /tdn:$DBNAME /tu:sa /tp:$SA_PASSWORD /sf:mssql-latest.bacpac \
#     && pkill sqlservr
# RUN ( /opt/mssql/bin/sqlservr & ) && sleep 10
# RUN echo "I want to know what these Variables are: $DBNAME, $SA_PASSWORD"
# RUN ls -al

RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    /opt/sqlpackage/sqlpackage "/a:Import /tsn:. /tdn:$DBNAME /tu:sa /tp:$SA_PASSWORD /sf:/mssql-latest.bacpac" \
    && pkill sqlservr
#Cleanup
RUN rm mssql-latest.bacpac sqlpackage.zip
