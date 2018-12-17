FROM gogs/gogs

##############################
# Configure Gogs             #
##############################


# SQL
RUN apk add --update sqlite

# https
COPY ssl/Gogs.crt /etc/cert/Gogs.crt
COPY ssl/Gogs.key /etc/cert/Gogs.key

COPY ssl/ca.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# data
COPY data /data

#
# eof ..
