FROM ubuntu:16.04

LABEL author="Kersten Breuer, Zeller Team, EMBL 2018" \
    maintainer="kersten-breuer@outlook.com"

# Package versions/links:
ENV TIDYVERSE_VER 1.2.1
ENV GRIDEXTRA_VER 2.3

# Install essential dependencies:
RUN apt-get update -qq -y --fix-missing
RUN apt-get install -y \
    build-essential \
    wget \
    tar \
    r-base \
    curl \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
	libcurl4-openssl-dev

# Install samtools:
RUN CMDS="install.packages(\"devtools\", repos=\"http://cran.us.r-project.org\")" \
    && CMDS="${CMDS}; library(devtools)" \
	&& CMDS="${CMDS}; install_version(\"tidyverse\", version=\"${TIDYVERSE_VER}\", repos=\"http://cran.us.r-project.org\")" \
	&& CMDS="${CMDS}; install_version(\"gridExtra\", version=\"${GRIDEXTRA_VER}\", repos=\"http://cran.us.r-project.org\")" \
	&& Rscript -e "${CMDS}"
