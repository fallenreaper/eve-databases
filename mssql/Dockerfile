FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Password123!
ENV MSSQL_PID=Developer
ENV DBNAME=evesde

EXPOSE 1433
USER root

RUN apt-get update \
    && apt-get install unzip ca-certificates libssl-dev -y

RUN wget -progress=bar:force -q -O /latest-mssql.bak https://www.fuzzwork.co.uk/dump/latest-mssql.bak  

RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -C -Q "RESTORE DATABASE [$DBNAME] FROM DISK = N'/latest-mssql.bak' WITH REPLACE" \
    && pkill sqlservr

#Cleanup of created bulk files no longer needed.
RUN rm latest-mssql.bak
# RUN rm latest-mssql.bak sqlpackage.zip
