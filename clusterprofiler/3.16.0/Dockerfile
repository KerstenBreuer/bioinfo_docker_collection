FROM informationsea/bioconda:3

LABEL author="Kersten Breuer, Cancer Epigenomics, Plass Team, DKFZ 2019" \
    maintainer="kersten-breuer@outlook.com"

# Tool versions:
ENV CLUSTERPROFILER_VERSION 3.16.0
ENV REACTOMEPA_VERSION 1.32.0
ENV REACTOMEDB_VERSION 1.70.0

# Install basic R dependecies:
ENV DEBIAN_FRONTEND noninteractive
RUN conda install -c conda-forge -c bioconda \
	r-tidyverse \
	bioconductor-clusterprofiler==${CLUSTERPROFILER_VERSION} \
	bioconductor-reactomepa==${REACTOMEPA_VERSION} \
	bioconductor-reactome.db==${REACTOMEDB_VERSION} \
	bioconductor-org.hs.eg.db \
	bioconductor-chipseeker \
	bioconductor-txdb.hsapiens.ucsc.hg38.knowngene