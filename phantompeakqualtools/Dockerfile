FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# install needed unix packages
RUN apt-get update --fix-missing -qq; \
    apt-get install -y \
	libboost-all-dev \
	r-base \
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
	gawk
	
#Install samtools v1.5:
RUN cd /usr/bin/ \
    && wget https://github.com/samtools/samtools/releases/download/1.5/samtools-1.5.tar.bz2 \
	&& tar jxf samtools-1.5.tar.bz2 \
	&& rm samtools-1.5.tar.bz2 \
	&& cd /usr/bin/samtools-1.5 \
	&& make \
	&& make install
	
# download phantompeakqualtools v1.2:
RUN cd /usr/bin \
	&& wget  https://github.com/kundajelab/phantompeakqualtools/archive/1.2.tar.gz \
    && tar -xzvf 1.2.tar.gz \
	&& rm 1.2.tar.gz \
	&& chmod 777 /usr/bin/phantompeakqualtools-1.2/run_spp.R

# install all needed R packages:
RUN Rscript -e "install.packages('snow', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "install.packages('snowfall', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "install.packages('bitops', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "install.packages('caTools', repos='http://cran.us.r-project.org')" \
	&& Rscript -e "source('http://bioconductor.org/biocLite.R'); biocLite('Rsamtools',suppressUpdates=TRUE)" \
	&& Rscript -e "install.packages('/usr/bin/phantompeakqualtools-1.2/spp_1.14.tar.gz')"

ENV PATH=/usr/bin/samtools-1.5/:/usr/bin/phantompeakqualtools-1.2/:${PATH}