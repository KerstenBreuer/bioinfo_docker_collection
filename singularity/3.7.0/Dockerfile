## Please note, this container has to run in privileged mode
## ("--privileged" flag on docker CLI) to function correctly.

FROM ubuntu:20.04

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV SINGULARITY_VERSION 3.7.0

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

# install singularity:
ENV DEBCONF_FRONTEND noninteractive
RUN echo "console-setup   console-setup/charmap47 select  UTF-8" > encoding.conf && \
	debconf-set-selections encoding.conf && \
	rm encoding.conf && \
	DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
		squashfs-tools \
		uuid-dev \
		libgpgme11-dev \
		libseccomp-dev \
		pkg-config \
		git \
		cryptsetup-bin

ENV GOPATH /usr/local/go_path
ENV PATH /usr/local/go/bin:${PATH}:${GOPATH}/bin
RUN wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz && \
	tar -C /usr/local -xzvf go1.15.6.linux-amd64.tar.gz && \
    rm go1.15.6.linux-amd64.tar.gz && \
	go get -u github.com/golang/dep/cmd/dep

RUN cd /usr/local/ && \
	wget -O singularity.tar.gz https://github.com/singularityware/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-${SINGULARITY_VERSION}.tar.gz && \
	tar xzvf singularity.tar.gz && \
	rm singularity.tar.gz && \
	cd singularity && \
	./mconfig && \
	make -C ./builddir && \
	make -C ./builddir install

ENV PATH /usr/local/singularity/:${PATH}

CMD ["cwlab", "up", "-c", "/etc/cwlab/config.yaml"]