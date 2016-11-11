FROM ubuntu:16.04
MAINTAINER Peter Story <pstory@andrew.cmu.edu>

RUN apt-get update

# Setting up SSH
# Based on: https://docs.docker.com/engine/examples/running_ssh_service/
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22

# Setting up supervisord
# Install the supervisor daemon, which starts all the components
# Preventing this error: "invoke-rc.d: policy-rc.d denied execution of start."
# Thanks to: https://hub.docker.com/r/stolus/ubuntu/~/dockerfile/
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
RUN apt-get -y install supervisor
# Link the config file into place
RUN ln -sf \
/root/protege/docker_resources/supervisord.conf \
/etc/supervisor/conf.d/supervisord.conf

# Install Protege
RUN apt-get -y install openjdk-8-jre-headless
RUN wget https://github.com/protegeproject/protege-distribution/releases/download/protege-5.0.0/Protege-5.0.0-linux.tar.gz
RUN tar -xf Protege-5.0.0-linux.tar.gz

# Add resources
RUN mkdir -p /root/protege/docker_resources
ADD docker_resources /root/protege/docker_resources

CMD ["/usr/bin/supervisord"]
