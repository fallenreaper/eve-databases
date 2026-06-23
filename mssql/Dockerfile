# FROM mcr.microsoft.com/mssql/server:2017-CU31-GDR2-ubuntu-18.04
# FROM mcr.microsoft.com/mssql/server:2019-latest
FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Password123!
ENV MSSQL_PID=Developer
ENV DBNAME=evesde

EXPOSE 1433
USER root

RUN apt-get update \
    && apt-get install unzip ca-certificates libssl-dev -y
#RUN wget -progress=bar:force -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2165213 \
#    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
#    && chmod +x /opt/sqlpackage/sqlpackage

RUN wget -progress=bar:force -q -O /latest-mssql.bak https://www.fuzzwork.co.uk/dump/latest-mssql.bak  

RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -C -Q " \
        DECLARE @LogicalName NVARCHAR(128), @Type CHAR(1), @Sql NVARCHAR(MAX); \
        DECLARE @FileList TABLE (LogicalName NVARCHAR(128), PhysicalName NVARCHAR(260), Type CHAR(1), FileGroupName NVARCHAR(128), Size NUMERIC(20,0), MaxSize NUMERIC(20,0), FileId BIGINT, CreateLSN NUMERIC(25,0), DropLSN NUMERIC(25,0), UniqueId UNIQUEIDENTIFIER, ReadOnlyLSN NUMERIC(25,0), ReadWriteLSN NUMERIC(25,0), BackupSizeInBytes BIGINT, SourceBlockSize INT, FileGroupId INT, LogGroupGUID UNIQUEIDENTIFIER, DifferentialBaseLSN NUMERIC(25,0), DifferentialBaseGUID UNIQUEIDENTIFIER, IsReadOnly BIT, IsPresent BIT, TDEThumbprint VARBINARY(32), SnapshotUrl NVARCHAR(255)); \
        INSERT INTO @FileList EXEC('RESTORE FILELISTONLY FROM DISK = N''/latest-mssql.bak'''); \
        SET @Sql = 'RESTORE DATABASE [$(DBNAME)] FROM DISK = N''/latest-mssql.bak'' WITH REPLACE, STATS = 10'; \
        DECLARE FileCursor CURSOR FOR SELECT LogicalName, Type FROM @FileList; \
        OPEN FileCursor; \
        FETCH NEXT FROM FileCursor INTO @LogicalName, @Type; \
        WHILE @@FETCH_STATUS = 0 \
        BEGIN \
            IF @Type = 'D' SET @Sql = @Sql + ', MOVE ''' + @LogicalName + ''' TO ''/var/opt/mssql/data/evesde.mdf'''; \
            IF @Type = 'L' SET @Sql = @Sql + ', MOVE ''' + @LogicalName + ''' TO ''/var/opt/mssql/data/evesde_log.ldf'''; \
            FETCH NEXT FROM FileCursor INTO @LogicalName, @Type; \
        END; \
        CLOSE FileCursor; DEALLOCATE FileCursor; \
        EXEC sp_executesql @Sql;" \
    && pkill sqlservr

#Cleanup of created bulk files no longer needed.
RUN rm latest-mssql.bak
# RUN rm latest-mssql.bak sqlpackage.zip
