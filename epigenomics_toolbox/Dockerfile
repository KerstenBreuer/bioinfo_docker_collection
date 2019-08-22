FROM ubuntu:18.04

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV SAMTOOLS_URL https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2
ENV SINGULARITY_VERSION 3.3.0
ENV MULTIQC_VERSION 1.7
ENV DEEPTOOLS_VERSION 3.1.1

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
	curl \
    bzip2 \
	libtool \
	git \
	python3-dev \
	python3-pip \
	libz-dev \
    libssl-dev \
	libcurl4-openssl-dev \
	cmake \
	zlib1g-dev  \
	libghc-bzlib-dev \
	liblzma-dev  \
	libncurses5-dev \
    libhts-dev \
    autoconf

# Install samtools:
RUN cd /usr/local/ \
    && wget -O samtools.tar.bz2 ${SAMTOOLS_URL} \
	&& tar -jxf samtools.tar.bz2 \
	&& rm samtools.tar.bz2 \
	&& mv samtools* samtools \
	&& cd samtools \
    && autoheader \
    && autoconf -Wno-syntax \
    && ./configure \
	&& make \
	&& make install
ENV PATH=/usr/local/samtools/:${PATH}

# install golang:
ENV GOPATH /usr/local/go_path
RUN wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz && \
	tar -C /usr/local -xzvf go1.12.7.linux-amd64.tar.gz && \
    rm go1.12.7.linux-amd64.tar.gz && \
	go get -u github.com/golang/dep/cmd/dep
ENV PATH /usr/local/go/bin:${PATH}:${GOPATH}/bin


# install singularity:
ENV DEBCONF_FRONTEND noninteractive
RUN echo "console-setup   console-setup/charmap47 select  UTF-8" > encoding.conf && \
	debconf-set-selections encoding.conf && \
	rm encoding.conf \
	apt-get install -y \
	squashfs-tools \
	uuid-dev \
	libgpgme11-dev \
	libseccomp-dev \
	pkg-config && \
	cd /usr/local/ && \
	wget -O singularity.tar.gz https://github.com/singularityware/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-${SINGULARITY_VERSION}.tar.gz && \
	tar xzvf singularity.tar.gz && \
	rm singularity.tar.gz && \
	cd singularity && \
	./mconfig && \
	make -C ./builddir && \
	make -C ./builddir install
ENV PATH /usr/local/singularity/:${PATH}


## Install python dependencies:
RUN python3 -m pip install --upgrade pip && \
	python3 -m pip install \
	numpy \
	scipy \
	py2bit \
	pysam \
	matplotlib \
	pyBigWig \
	plotly \
	multiqc==${MULTIQC_VERSION} \
	deeptools==${DEEPTOOLS_VERSION} \
	cwltool