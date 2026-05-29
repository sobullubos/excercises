
FROM ubuntu:22.04

# Avoid interactive prompts, because all the commands are run in a non-interactive environment as part of the build process.
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible && \
    apt-get clean
