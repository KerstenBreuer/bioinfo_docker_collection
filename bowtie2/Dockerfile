# This script installs Bowtie2 v2.2.6 along with genome index files:

FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install wget unzip libtbb-dev

#Install Bowtie2 v2.3.2:
RUN apt-get -y install bowtie2=2.2.6-2

CMD ["bowtie2"]