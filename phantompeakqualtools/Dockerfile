FROM conda/miniconda3

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

ENV PHANTOMPEAKQUALTOOLS_VERSION 1.2

# install needed unix packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing -qq; \
    apt-get install -y \
	libboost-all-dev \
	wget \
	tar \
	cmake \
	zlib1g-dev  \
	bzip2 \
	libghc-bzlib-dev \
	zlib1g-dev \
	liblzma-dev  \
	libncurses5-dev \
	imagemagick \
	gawk \
	gnupg2 \
	curl \
	libcurl4-openssl-dev
	
#Install samtools v1.5:
RUN cd /usr/bin/ \
    && wget https://github.com/samtools/samtools/releases/download/1.5/samtools-1.5.tar.bz2 \
	&& tar jxf samtools-1.5.tar.bz2 \
	&& rm samtools-1.5.tar.bz2 \
	&& cd /usr/bin/samtools-1.5 \
	&& make \
	&& make install
	
# download phantompeakqualtools:
RUN cd /usr/bin \
	&& wget  https://github.com/kundajelab/phantompeakqualtools/archive/${PHANTOMPEAKQUALTOOLS_VERSION}.tar.gz \
    && tar -xzvf ${PHANTOMPEAKQUALTOOLS_VERSION}.tar.gz \
	&& rm ${PHANTOMPEAKQUALTOOLS_VERSION}.tar.gz \
	&& chmod 777 /usr/bin/phantompeakqualtools-${PHANTOMPEAKQUALTOOLS_VERSION}/run_spp.R

# install all needed R packages:
RUN conda install -c bioconda -c conda-forge \
	r-snow \
	r-bitops \
	r-caTools \
	bioconductor-rsamtools \
	phantompeakqualtools==${PHANTOMPEAKQUALTOOLS_VERSION}

ENV PATH=/usr/bin/samtools-1.5/:/usr/bin/phantompeakqualtools-${PHANTOMPEAKQUALTOOLS_VERSION}/:${PATH}














