#!/bin/bash
if [ -z ${1} ]
then
	echo "Need have an arg representing the date.  ( yyyymmdd )"
	exit 1
fi
DATE=${1}

# For docker buildx you need to make sure that Docker for Desktop has Experimental mode on, and you will also need to create a builder.
# The simple builder i use is: `docker buildx create --use --name mybuild` i believe.


docker buildx build -t fallenreaper/eve-postgres:$DATE --platform linux/amd64,linux/arm64,linux/arm/v7 --push  -t fallenreaper/eve-postgres .
