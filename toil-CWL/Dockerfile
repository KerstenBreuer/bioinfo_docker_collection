FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2017" \
    maintainer="kersten-breuer@outlook.com"

# Install essential unix packages and dependencies:
RUN apt-get update -y --fix-missing
RUN apt-get install -y build-essential \
    python-dev \
    python-pip \
    wget \
    nodejs

# Get virtualenv:
ENV VIRTUALENV_URL  https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-15.1.0.tar.gz
RUN cd /usr/local/ && \
	wget -O virtualenv.tar.gz ${VIRTUALENV_URL} && \
	tar xzvf virtualenv.tar.gz && \
	rm virtualenv.tar.gz && \
	mv *virtualenv* virtualenv && \
    python ./virtualenv/virtualenv.py venv

## Install toil:
ENV TOIL_VERSION 3.17.0
RUN /bin/bash -c "source /usr/local/venv/bin/activate ; pip install toil[CWL]==${TOIL_VERSION}"
ENV PATH=/usr/local/venv/bin/:${PATH}