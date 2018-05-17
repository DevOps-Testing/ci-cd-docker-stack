FROM jenkins/jenkins:lts

ARG user=jenkins
ARG group=jenkins
ARG gid_docker=600

USER root
RUN apt-get update
RUN apt-get install -y apt-transport-https apt-utils sudo ca-certificates ca-certificates-java curl gnupg2 software-properties-common
RUN groupadd -g ${gid_docker} docker && usermod -aG docker ${user}
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add –
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install docker-ce && docker-compose

RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# basic conf
USER ${user}
ADD jenkins_home /usr/share/jenkins/ref

# https
ADD ssl/Jenkins.csr /var/lib/jenkins/Jenkins.csr
ADD ssl/Jenkins.key /var/lib/jenkins/Jenkins.key
ENV JENKINS_OPTS --httpPort=-1 --httpsPort=30080 --httpsCertificate=/var/lib/jenkins/Jenkins.csr --httpsPrivateKey=/var/lib/jenkins/Jenkins.key

ADD ssl/CICD.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# tell Jenkins that no banner prompt for pipeline plugins is needed
# see: https://github.com/jenkinsci/docker#preinstalling-plugins
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

#
# eof ..
