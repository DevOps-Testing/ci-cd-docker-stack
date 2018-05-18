FROM sonatype/nexus3 

##############################
# Configure Nexus            #
##############################

ARG user=200
ARG group=200
USER root

# https
ADD data/jetty-https.xml /nexus-data/etc/jetty/jetty-https.xml
ADD ssl/Jenkins.jks /nexus-data/etc/jetty/Nexus.jks
RUN chown -R ${user}:${group} /nexus-data

USER ${user}

#
# eof ..
