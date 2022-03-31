curl -o mysql-latest.tar.bz2 https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2
bunzip2 mysql-latest.tar.bz2
tar -xf mysql-latest.tar
for db in $(ls -d */); do cp $db/*.sql .; done;