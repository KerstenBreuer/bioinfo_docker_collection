FROM ubuntu:18.04

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

RUN apt-get -y update --fix-missing -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
    build-essential \
    checkinstall \
    wget \
    unzip \
    libtbb-dev \
    libxml2-dev \
    r-base-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    openjdk-8-jdk \
    libboost-all-dev \
    tar \
    cmake \
    zlib1g-dev \
    bzip2 \
    libghc-bzlib-dev \
    liblzma-dev \
    libncurses5-dev \
    imagemagick \
    gawk \
    python-setuptools \
    python-rpy2 \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    gcc-multilib gcc \
    apt-utils \
    vim-common \
    libbam-dev \
    software-properties-common \
    unzip \
    glib-networking-common \
    autoconf \
    libtool \
    libz-dev \
    libcurl4-openssl-dev \
    libcairo2-dev \
    libsqlite-dev \
    libmariadbd-dev \
    libmariadbclient-dev \
    libpq-dev \
    libssh2-1-dev \
    libhts-dev \
    software-properties-common \
    python3-software-properties \
    nodejs \
    ca-certificates \
    libxslt-dev
RUN cd /usr/local/ && \
	wget -O llvm https://apt.llvm.org/llvm-snapshot.gpg.key && \
	apt-key add llvm && \
	apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" && \
	apt-get update && \
	apt-get install -y clang

