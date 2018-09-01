FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

ENV APPL_URL http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig

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


RUN cd /usr/local \
    && wget -O bedGraphToBigWig ${APPL_URL} \
    && chmod -R 777 bedGraphToBigWig

ENV PATH=/usr/local/:${PATH}

