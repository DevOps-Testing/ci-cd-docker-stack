FROM sonatype/nexus3 

##############################
# Configure Nexus            #
##############################

ARG user=200
ARG group=200
USER root

# https
ADD data/nexus.properties /nexus-data/etc/nexus.properties
ADD data/jetty-https.xml /nexus-data/etc/jetty/jetty-https.xml
ADD ssl/Nexus.jks /etc/ssl/keystore.jks
RUN chown -R ${user}:${group} /nexus-data

USER ${user}

#
# eof ..
