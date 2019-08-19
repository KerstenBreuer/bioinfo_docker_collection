FROM ubuntu:16.04

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV FAME_URL https://github.com/FischerJo/FAME/archive/v0.2-beta.tar.gz

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
	zlib1g-dev  \
	libghc-bzlib-dev \
	zlib1g-dev

# install FAME:
RUN cd /usr/local/ && \
	wget -O FAME.tar.gz ${FAME_URL} && \
	tar xzvf FAME.tar.gz && \
	rm FAME.tar.gz && \
	mv FAME* FAME && \
	cd FAME && \
	make

ENV PATH=/usr/local/FAME/:${PATH}