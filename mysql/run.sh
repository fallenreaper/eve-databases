#!/bin/bash

if [ -z ${1} ]
then
	echo "Need to pass in a date argument. ( yyyymmdd )"
	exit 1
fi
DATE=${1}
rm mysql-latest.tar
rm -rf sde*
rm *.sql

curl -k -o mysql-latest.tar.bz2 https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2
bzip2 -d mysql-latest.tar.bz2
tar -xvf mysql-latest.tar
mv sde*/*.sql .
# docker buildx build -t fallenreaper/eve-mysql:$DATE --platform linux/amd64,linux/arm64,linux/arm/v7 --push  -t fallenreaper/eve-mysql .

docker build -t fallenreaper/eve-mysql:latest .
docker tag fallenreaper/eve-mysql:latest fallenreaper/eve-mysql:$DATE
docker push fallenreaper/eve-mysql
