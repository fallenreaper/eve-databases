curl -o mysql-latest.tar.bz2 https://www.fuzzwork.co.uk/dump/latest-mysql.sql.gz 
gunzip latest-mysql.sql.gz 
# tar -xf mysql-latest.tar
for db in $(ls -d */); do cp $db/*.sql .; done;