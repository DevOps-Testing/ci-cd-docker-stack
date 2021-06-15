FROM sonarqube:lts
USER root
COPY ssl/ca.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

USER sonarqube
##############################
# Configure Sonarqube        #
##############################


# https
#ADD ssl/Sonarqube.crt /etc/cert/Sonarqube.crt
#ADD ssl/Sonarqube.key /etc/cert/Sonarqube.key

# data
#ADD data /data
#COPY conf/sonar.properties /opt/sonarqube/conf/ #For custom properties

#
# eof ..
