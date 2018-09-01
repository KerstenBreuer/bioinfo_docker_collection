FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

ENV UCSC_USERAPPS_URL http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v369.src.tgz

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
    git \
    libz-dev libssl-dev \
    openssl \
    libpng12-dev \
    mysql-client  \
    libmysqlclient-dev

# Install utilities
RUN cd /usr/local \
    && wget -O userApps.tgz ${UCSC_USERAPPS_URL} \
    && tar -xzvf userApps.tgz \
    && rm userApps.tgz \
    && chmod -R 777 ./userApps/

ENV PATH=/usr/local/userApps/kent/src/utils/:${PATH}
