FROM sonatype/nexus3:latest 

##############################
# Configure Nexus            #
##############################

ARG user=200
ARG group=200
USER root

ADD data/nexus.properties /opt/sonatype/nexus/etc/nexus.properties
RUN chown -R ${user}:${group} /opt/sonatype/nexus/

USER ${user}

#
# eof ..
