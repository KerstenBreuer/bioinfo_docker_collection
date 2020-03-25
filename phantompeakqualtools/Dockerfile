FROM ubuntu:18.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

ENV R_VERSION 3.6.1
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
	gnupg2
	
# add cran25 repo:
RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 \
	&& gpg -a --export E084DAB9 | sudo apt-key add -
RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" > /etc/apt/sources.list.d/cran_repo.list \
	&& apt-get update --fix-missing -qq \
    && apt-get install -y r-base==${R_VERSION}

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
RUN Rscript -e "install.packages('snow', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "install.packages('snowfall', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "install.packages('bitops', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "install.packages('caTools', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "source('http://bioconductor.org/biocLite.R'); biocLite('Rsamtools',suppressUpdates=TRUE)" \
	&& Rscript -e "install.packages('/usr/bin/phantompeakqualtools-${PHANTOMPEAKQUALTOOLS_VERSION}/spp_1.14.tar.gz')"

ENV PATH=/usr/bin/samtools-1.5/:/usr/bin/phantompeakqualtools-${PHANTOMPEAKQUALTOOLS_VERSION}/:${PATH}














