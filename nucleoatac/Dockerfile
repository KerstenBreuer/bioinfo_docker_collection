FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV NUCLEOATAC_URL https://github.com/GreenleafLab/NucleoATAC/archive/v0.3.4.tar.gz

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
	curl \
	libtool
RUN apt-get install -y \
	python2.7 \
	python-pip \
	libz-dev \
    libssl-dev \
	libcurl4-openssl-dev

# install python requirements
RUN pip install --upgrade pip
RUN pip install\
	numpy==1.15.1 \
	scipy \
	pysam==0.8.1 \
	matplotlib \
	Cython==0.22
	
# install nucleoatac:
RUN cd /usr/local/ && \
	wget -O nucleoatac.tar.gz ${NUCLEOATAC_URL} && \
	tar xzvf nucleoatac.tar.gz && \
	rm nucleoatac.tar.gz && \
	mv *ucleo* nucleoatac && \
	cd nucleoatac && \
	pip install .

ENV PATH=/usr/local/nucleoatac/:${PATH}