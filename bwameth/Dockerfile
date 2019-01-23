FROM kerstenbreuer/samtools:1.7

LABEL author="Kersten Breuer, Zeller Team, EMBL 2017" \
    maintainer="kersten-breuer@outlook.com"

# Install essential unix packages and dependencies:
RUN apt-get install -y \
	unzip \
    python-dev \
    python-pip
RUN apt-get install -y bwa
RUN pip install toolshed

# Package versions/links:
ENV BWAMETH_LINK "https://github.com/brentp/bwa-meth/archive/v0.2.2.zip"

# Install main package:
RUN cd /usr/local/ \
	&& wget ${BWAMETH_LINK} \
	&& unzip *.zip \
	&& rm -rf *.zip \
	&& mv bwa-meth* bwameth \
	&& cd bwameth \
	&& chmod a+x bwameth.py

ENV PATH="/usr/local/bwameth:${PATH}"

CMD ["bwameth.py"]