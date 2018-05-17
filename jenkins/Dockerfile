FROM jenkins/jenkins:lts

ARG user=jenkins
ARG group=jenkins
ARG gid_docker=600

USER root
RUN apt-get update
RUN apt-get install -y apt-transport-https apt-utils sudo ca-certificates ca-certificates-java curl gnupg2 software-properties-common vim net-tools
RUN groupadd -g ${gid_docker} docker && usermod -aG docker ${user}
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN wget https://download.docker.com/linux/debian/gpg -O /tmp/gpg && apt-key add /tmp/gpg
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce docker-compose

RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# https
ADD ssl/Jenkins.crt /usr/local/etc/jenkins/Jenkins.crt
ADD ssl/Jenkins.key /usr/local/etc/jenkins/Jenkins.key
ENV JENKINS_OPTS --httpPort=-1 --httpsPort=30080 --httpsCertificate=/usr/local/etc/jenkins/Jenkins.crt --httpsPrivateKey=/usr/local/etc/jenkins/Jenkins.key
RUN chown -R ${user}:${group} /usr/local/etc/jenkins/

#ADD ssl/CICD.crt /usr/local/share/ca-certificates/
#RUN update-ca-certificates

# basic conf
USER ${user}
ADD jenkins_home /usr/share/jenkins/ref

# plugins
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# tell Jenkins that no banner prompt for pipeline plugins is needed
# see: https://github.com/jenkinsci/docker#preinstalling-plugins
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

#
# eof ..
