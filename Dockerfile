FROM ubuntu:alpine

# Make sure the package repository is up to date.
RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy git curl && \
    mkdir -p /var/run/sshd && \
    apt-get install -qy openjdk-8-jdk && \
    apt-get install -qy maven && \
    
RUN sudo apt update \
  && sudo apt install apt-transport-https ca-certificates curl software-properties-common \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
  && sudo apt update \
  && apt-cache policy docker-ce \
  && sudo apt install docker-ce \
  && sudo systemctl status docker \
  && sudo usermod -aG docker ${USER} \
  && su - ${USER} \
  && sudo usermod -aG docker username
