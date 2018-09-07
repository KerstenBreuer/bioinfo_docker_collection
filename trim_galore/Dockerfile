FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV CUTADAPT_VERSION 1.14
ENV FASTQC_URL http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
ENV TRIM_GALORE_URL https://github.com/FelixKrueger/TrimGalore/archive/0.4.4.tar.gz

RUN apt-get -y update
RUN apt-get -y install \
    wget \
    tar \
    unzip \
    ca-certificates \
    python-dev \
    python-pip \
    openjdk-8-jdk

# Install cutadapt:
RUN pip install cutadapt==${CUTADAPT_VERSION}

#Install FASTQC
RUN cd /usr/local \
	&& wget -O fastqc.zip ${FASTQC_URL} \
	&& unzip fastqc.zip \
	&& rm fastqc.zip \
	&& cd FastQC \
	&& chmod a+x fastqc
ENV PATH=/usr/local/FastQC:${PATH}

#Install Trim Galore
RUN cd /usr/local \
  && wget -O trim_galore.tar.gz ${TRIM_GALORE_URL} \
  && tar -xvzf trim_galore.tar.gz \
  && mv TrimGalore*/trim_galore /usr/local/bin \
  && rm -r TrimGalore* trim_galore.tar.gz

CMD ["trim_galore"]