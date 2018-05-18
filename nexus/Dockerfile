FROM sonatype/nexus3 

##############################
# Configure Nexus            #
##############################

# TODO Konf anpassen
ARG user=200
ARG group=200
USER root

# https
ADD ssl/Nexus.crt /usr/local/etc/nexus/Jenkins.crt
ADD ssl/Nexus.key /usr/local/etc/nexus/Jenkins.key
RUN chown -R ${user}:${group} /usr/local/etc/nexus/

USER ${user}

#
# eof ..
