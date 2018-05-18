FROM gogs/gogs

##############################
# Configure Gogs             #
##############################


# SQL
RUN apk add --update sqlite

# https
ADD ssl/Gogs.crt /etc/cert/Gogs.crt
ADD ssl/Gogs.key /etc/cert/Gogs.key

# data
ADD data /data

#
# eof ..
