FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV DEEPTOOlS_URL https://github.com/deeptools/deepTools/archive/3.1.1.tar.gz

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
	curl \
    tar \
    bzip2 \
	cmake \
	ocl-icd-libopencl1 \
	opencl-headers \
	clinfo \
	zlib1g-dev  \
	python-dev \
	python-pip \
	libtool

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
	wget ${DEEPTOOlS_URL} && \
	tar xzvf *.tar.gz && \
	rm *.tar.gz && \
	&& mv deepTools* deepTools && \
	cd deepTools && \
	python setup.py install

ENV PATH=/usr/local/deepTools/:${PATH}