########################################
### Dockerfile for running deeptools ###
########################################

FROM python:2.7.13

# install requirement numpy
RUN pip install \
	numpy \
	scipy \
	py2bit \
	pyBigWig \
	pysam \
	matplotlib

# install deeptools (remaining requirements should install automatically):
RUN cd /srv; \
	wget https://github.com/fidelram/deepTools/archive/2.3.3.tar.gz; \
	tar xzvf 2.3.3.tar.gz; \
	rm 2.3.3.tar.gz; \
	cd deepTools-2.3.3; \
	python setup.py install
