#!/bin/bash
if [ -z ${1} ]
then
	echo "Need have an arg representing the date.  ( yyyymmdd )"
	exit 1
fi
DATE=${1}
rm postgres-schema-latest.dmp
curl -k -o postgres-schema-latest.dmp.bz2 https://www.fuzzwork.co.uk/dump/postgres-schema-latest.dmp.bz2
bzip2 -d postgres-schema-latest.dmp.bz2

# For docker buildx you need to make sure that Docker for Desktop has Experimental mode on, and you will also need to create a builder.
# The simple builder i use is: `docker buildx create --use --name mybuild` i believe.


docker buildx build -t fallenreaper/eve-postgres:$DATE --platform linux/amd64,linux/arm64,linux/arm/v7 --push  -t fallenreaper/eve-postgres .

#docker build -t fallenreaper/eve-postgres:latest .
#docker tag fallenreaper/eve-postgres:latest fallenreaper/eve-postgres:$DATE
#docker push fallenreaper/eve-postgres

