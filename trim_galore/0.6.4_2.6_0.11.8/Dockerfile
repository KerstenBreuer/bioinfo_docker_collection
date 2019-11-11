FROM ubuntu:16.04

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV CUTADAPT_VERSION 2.6
ENV FASTQC_VERSION 0.11.8
ENV TRIM_GALORE_VERSION 0.6.4

RUN apt-get -y update
RUN apt-get -y install \
    wget \
    tar \
    unzip \
    ca-certificates \
    python3-dev \
    python3-pip \
    openjdk-8-jdk \
    pigz

# Install cutadapt:
RUN pip3 install cutadapt==${CUTADAPT_VERSION}

#Install FASTQC
RUN cd /usr/local \
	&& wget -O fastqc.zip http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VERSION}.zip \
	&& unzip fastqc.zip \
	&& rm fastqc.zip \
	&& cd FastQC \
	&& chmod a+x fastqc
ENV PATH=/usr/local/FastQC:${PATH}

#Install Trim Galore
RUN cd /usr/local \
  && wget -O trim_galore.tar.gz https://github.com/FelixKrueger/TrimGalore/archive/${TRIM_GALORE_VERSION}.tar.gz \
  && tar -xvzf trim_galore.tar.gz \
  && mv TrimGalore*/trim_galore /usr/local/bin \
  && rm -r TrimGalore* trim_galore.tar.gz

CMD ["trim_galore"]