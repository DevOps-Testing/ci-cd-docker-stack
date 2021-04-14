FROM gogs/gogs:latest

##############################
# Configure Gogs             #
##############################

# https
COPY ssl/Gogs.crt /etc/cert/Gogs.crt
COPY ssl/Gogs.key /etc/cert/Gogs.key
COPY ssl/ca.crt /usr/local/share/ca-certificates/

RUN apk add --update sqlite \
	&& update-ca-certificates 2>/dev/null || true

# data
COPY data /data

#
# eof ..
