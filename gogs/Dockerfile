FROM gogs/gogs

##############################
# Configure Gogs             #
##############################


# SQL
RUN apk add --update sqlite

# https
ADD ssl/Gogs.csr /etc/cert/Gogs.csr
ADD ssl/Gogs.key /etc/cert/Gogs.key
