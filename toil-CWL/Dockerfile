FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2017" \
    maintainer="kersten-breuer@outlook.com"

# Install essential unix packages and dependencies:
RUN apt-get update -y --fix-missing
RUN apt-get install -y build-essential \
    python-dev \
    python-pip \
    nodejs \
    virtualenv 

## Install toil:
ENV TOIL_VERSION 3.17.0
RUN virtualenv /usr/bin/venv \
    && source /usr/bin/venv/bin/activate \
    && pip install toil[CWL]==${TOIL_VERSION}

CMD ["cwltoil"]