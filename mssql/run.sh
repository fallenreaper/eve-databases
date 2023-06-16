#!/bin/bash

if [ -z ${1} ]
then
	echo "Need to pass in a date argument. ( yyyymmdd )"
	exit 1
fi
DATE=${1}

# docker buildx build -t fallenreaper/eve-mysql:$DATE --platform linux/amd64,linux/arm64,linux/arm/v7 --push  -t fallenreaper/eve-mysql .

docker build -t fallenreaper/eve-mssql:latest .
docker tag fallenreaper/eve-mssql:latest fallenreaper/eve-mssql:$DATE
docker push fallenreaper/eve-mssql
