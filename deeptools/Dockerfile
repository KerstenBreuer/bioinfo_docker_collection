FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV DEEPTOOlS_VERSION 2.3.3

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
    bzip2 \
	cmake \
	zlib1g-dev  \
	python-dev \
	python-pip

# install requirement numpy
RUN pip install \
	numpy \
	scipy \
	py2bit \
	pyBigWig \
	pysam \
	matplotlib

# install deeptools (remaining requirements should install automatically):
RUN cd /usr/local/ && \
	wget https://github.com/fidelram/deepTools/archive/${DEEPTOOlS_VERSION}.tar.gz && \
	tar xzvf ${DEEPTOOlS_VERSION}.tar.gz && \
	rm ${DEEPTOOlS_VERSION}.tar.gz && \
	&& mv deepTools-${DEEPTOOlS_VERSION} deepTools && \
	cd deepTools && \
	python setup.py install

ENV PATH=/usr/local/deepTools/:${PATH}