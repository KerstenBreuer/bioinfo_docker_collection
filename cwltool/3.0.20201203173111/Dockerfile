FROM kerstenbreuer/singularity:3.7.0

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2020" \
    maintainer="kersten-breuer@outlook.com"

ENV CWLTOOL_VERSION 3.0.20201203173111

# Install python3.9:
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt update -y && \
    apt-get install -y python3.9 python3-pip

# Prepare CWL execution environment:
RUN apt-get install -y nodejs && \
    python3.9 -m pip install cwltool==${CWLTOOL_VERSION}