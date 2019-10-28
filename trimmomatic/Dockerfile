FROM ubuntu:18.04

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

RUN apt-get -y update --fix-missing
RUN apt-get -y install wget \
  openjdk-8-jdk

ENV TRIMMOMATIC_VERSION "0.36+dfsg-3"

#Install Trimmomatic:
RUN apt-get -y install trimmomatic="${TRIMMOMATIC_VERSION}"

CMD ["java", "-jar", "/usr/share/java/trimmomatic.jar"]