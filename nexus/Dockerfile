FROM sonatype/nexus3 

##############################
# Configure Nexus            #
##############################

ARG user=200
ARG group=200
USER root

# https
ADD data/nexus.properties /nexus-data/etc/nexus.properties
ADD data/jetty-https.xml /opt/sonatype/nexus/etc/jetty/jetty-https.xml
ADD ssl/Nexus.jks /opt/sonatype/nexus/etc/ssl/keystore.jks
RUN chown -R ${user}:${group} /nexus-data
RUN chown -R ${user}:${group} /opt/sonatype/nexus/

USER ${user}

#
# eof ..
