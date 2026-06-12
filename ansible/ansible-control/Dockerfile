FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        ansible \
        sshpass \
        openssh-client && \
    apt-get clean

RUN mkdir -p /etc/ansible

COPY hosts /etc/ansible/hosts