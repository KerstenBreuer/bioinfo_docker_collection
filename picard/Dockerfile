# This script installs picard version 2.10.7:

FROM ubuntu:16.04

RUN apt-get -y update --fix-missing
RUN apt-get -y install wget openjdk-8-jdk

#Install Picard version 2.10.7:
RUN cd /bin; \
  wget https://github.com/broadinstitute/picard/releases/download/2.17.4/picard.jar;