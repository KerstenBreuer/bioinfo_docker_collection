FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV SAMTOOLS_URL https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
    bzip2 \
	cmake \
	zlib1g-dev  \
	bzip2 \
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

CMD ["samtools"]