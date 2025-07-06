FROM alpine/sqlite

RUN apk update && apk add curl bzip2


WORKDIR /db
RUN curl -k -o sqlite-latest.sqlite.bz2 https://www.fuzzwork.co.uk/dump/sqlite-latest.sqlite.bz2
RUN bzip2 -d sqlite-latest.sqlite.bz2

CMD ["sqlite3"]