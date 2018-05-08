FROM alpine:latest

#####################################
# Configure Alpine image as SQL DB  #
#####################################

RUN apk add --update sqlite

RUN mkdir /data
WORKDIR /data
ENTRYPOINT sqlite3 db.db