FROM kerstenbreuer/ubuntu_essentials:0.0.1

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"


# Install basic python dependencies:
RUN pip3 install --upgrade pip
RUN pip3 install\
	numpy \
	scipy \
	py2bit \
	pysam \
	matplotlib \
	pyBigWig \
	plotly

# Install basic R dependecies:
RUN install2.r --error \
    --deps TRUE \
    tidyverse \
    dplyr \
    devtools \
    formatR \
    remotes \
    selectr \
    BiocManage \
    gridExtra \
    readxl \
    plotly

# Tool versions:
ENV SAMTOOLS_VERSION 1.9
ENV DEEPTOOLS_VERSION 3.1.1
ENV FASTQC_VERSION 0.11.5
ENV MULTIQC_VERSION 1.7
ENV BEDTOOLS_VERSION 2.29.0

# Install samtools:
RUN cd /usr/local/ \
    && wget -O samtools.tar.bz2 \
    https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 \
	&& tar -jxf samtools.tar.bz2 \
	&& rm samtools.tar.bz2 \
	&& mv samtools* samtools \
	&& cd samtools \
    && autoheader \
    && autoconf -Wno-syntax \
    && ./configure \
	&& make \
	&& make install
ENV PATH="/usr/local/samtools/:${PATH}"

## Install BEDTOOLS:
RUN cd /usr/local/ \
	&& wget -O bedtools.zip https://github.com/arq5x/bedtools2/archive/v${BEDTOOLS_VERSION}.zip \
	&& unzip bedtools.zip \
	&& rm -rf bedtools.zip \
    && mv bedtools* bedtools \
	&& cd bedtools \
	&& chmod a+x bedtools
ENV PATH="/usr/local/bedtools:${PATH}"

## Install FastqQC:
RUN cd /usr/local/ \
	&& wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VERSION}.zip \
	&& unzip fastqc*.zip \
	&& rm -rf fastqc*.zip \
	&& cd FastQC \
	&& chmod a+x fastqc
ENV PATH="/usr/local/FastQC:${PATH}"

# Install Multiqc:
RUN pip install multiqc==${MULTIQC_VERSION}

