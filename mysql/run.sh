#!/bin/bash

if [ -z ${1} ]
then
	echo "Need to pass in a date argument. ( yyyymmdd )"
	exit 1
fi
DATE=${1}

docker build -t fallenreaper/eve-mysql:latest .
docker tag fallenreaper/eve-mysql:latest fallenreaper/eve-mysql:$DATE
docker push fallenreaper/eve-mysql
