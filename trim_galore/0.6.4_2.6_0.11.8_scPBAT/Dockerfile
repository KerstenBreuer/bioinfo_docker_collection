FROM kerstenbreuer/trim_galore:0.6.4_2.6_0.11.8

# Added Illumina Paired-End PCR Primer 2 sequence (CTACACGACGC) to FastQC
# adapters list as recommeded by http://dx.doi.org/10.1038/nprot.2016.187.

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

RUN echo -e '\nIllumina Paired-End PCR Primer 2\tCTACACGACGC' >> \
  /usr/local/FastQC/Configuration/adapter_list.txt

CMD ["trim_galore"]