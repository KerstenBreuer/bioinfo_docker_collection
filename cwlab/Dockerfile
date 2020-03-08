FROM ubuntu:18.04

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV CWLAB_VERSION 0.3.2 

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y build-essential \
    python-dev \
    python-pip \
    wget \
    nodejs

RUN python3 -m pip install cwlab==${CWLAB_VERSION}
