FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV KENTUTILS_URL https://github.com/ENCODE-DCC/kentUtils/archive/v302.1.0.tar.gz

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
    libtool \
	libz-dev libssl-dev \
	openssl \
	libpng12-dev \
	mysql-client  \
	libmysqlclient-dev

# Install kentutils
RUN cd /usr/local \
  && wget -O kentUtils.tar.gz ${KENTUTILS_URL} \
  && tar -xvzf kentUtils.tar.gz \
  && rm kentUtils.tar.gz \
  && mv kent* kentUtils \
  && cd kentUtils  \
  && make \
  && rm -r kentUtils.tar.gz

ENV PATH=/usr/local/kentUtils/:${PATH}
