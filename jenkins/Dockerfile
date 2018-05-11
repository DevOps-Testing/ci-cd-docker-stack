FROM jenkins/jenkins:lts

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
# TODO Nicht die richtige GID docker = 1001
ARG gid_docker=1001

USER root
RUN apt-get update && apt-get install -y apt-utils sudo ca-certificates ca-certificates-java \
      && groupadd -g ${gid_docker} docker \
      && usermod -aG docker ${user} \
      && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* \
      && rm -rf /tmp/*

# install maven (disto is 3.3.9-4)
ENV MAVEN_VERSION 3.5.3
RUN cd /usr/local; wget -q -O - http://ftp.fau.de/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xvfz - && \
    ln -sv /usr/local/apache-maven-$MAVEN_VERSION /usr/local/maven

# basic conf
USER ${user}
ADD jenkins_home /usr/share/jenkins/ref

# Fix
USER root
RUN chown -R jenkins:jenkins /usr/share/jenkins/ref

# https
USER ${user}
ADD ssl/Jenkins.csr /var/lib/jenkins/Jenkins.csr
ADD ssl/Jenkins.key /var/lib/jenkins/Jenkins.key
ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8080 --httpsCertificate=/var/lib/jenkins/Jenkins.csr --httpsPrivateKey=/var/lib/jenkins/Jenkins.key

USER root
chown -R jenkins:jenkins /var/lib/jenkins
ADD ssl/CICD.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# plugins
USER ${user}
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# tell Jenkins that no banner prompt for pipeline plugins is needed
# see: https://github.com/jenkinsci/docker#preinstalling-plugins
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

#
# eof ..
