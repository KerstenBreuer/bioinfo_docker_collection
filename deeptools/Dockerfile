FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV DEEPTOOLS_VERSION 3.3.1

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
	curl \
	libtool
RUN apt-get install -y \
	python3-dev \
	python3-pip \
	libz-dev \
    libssl-dev \
	libcurl4-openssl-dev

# install requirement numpy
RUN pip3 install --upgrade pip
RUN pip3 install\
	numpy \
	scipy \
	py2bit \
	pysam \
	matplotlib \
	pyBigWig \
	plotly

# install deeptools (remaining requirements should install automatically):
RUN cd /usr/local/ && \
	wget -O deepTools.tar.gz https://github.com/deeptools/deepTools/archive/${DEEPTOOLS_VERSION}.tar.gz && \
	tar xzvf deepTools.tar.gz && \
	rm deepTools.tar.gz && \
	mv deepTools* deepTools && \
	cd deepTools && \
	python3 setup.py install

ENV PATH=/usr/local/deepTools/:${PATH}