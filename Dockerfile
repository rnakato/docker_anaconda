FROM continuumio/anaconda:2019.03
LABEL maintainer "Ryuichiro Nakato <rnakato@iam.u-tokyo.ac.jp>"

WORKDIR /home

ENV PATH /opt/conda/bin:$PATH:/home/HiC-Pro_2.10.0/bin:/home/tadtool/bin:/home/rnakatoscript/TADbit:/home/rnakatoscript/pastis

<<<<<<< HEAD
RUN apt update \
    && apt install -y --no-install-recommends \
    vim \
    emacs \
    gcc \
    g++ \
    make \
    gfortran \
    liblzo2-dev \
    zlib1g-dev \
    mcl \
    bowtie2 \
    samtools \
    zip \
    unzip \
    r-base \
    procps \
    time \
    && apt clean

RUN conda update -y conda \
    && pip install -U pip \
    && pip install -U \
    cutadapt \
    pymc \
    pysam \
    pycallgraph \
    nolearn \
    cairocffi \
    autopep8 \
    pystan \
    hmmlearn \
    bx-python \
    pymp-pypi \
    iced \
    py3-ortools \
    pyfaidx \
    plotly \
    parameterized \
    requests \
    selenium \
    RSeQC \
    pyDNase \
    pastis \
    && conda install -y -c salilab imp \
    && conda install -y -c bioconda segway \
    && conda install -y numpy scipy scikit-learn pandas matplotlib seaborn Theano Flask SymPy IPython nltk pyqtgraph notebook pep8 pyflakes pytest pytest-pep8 beautifulsoup4 lxml html5lib wheel xlrd h5py cython numexpr statsmodels libgcc openpyxl bokeh
RUN git clone https://github.com/vaquerizaslab/tadtool && cd tadtool && python setup.py install
RUN git clone https://github.com/3DGenomes/TADbit && cd TADbit && python setup.py install

########RUN git clone https://github.com/hiclib/pastis && cd pastis && python setup.py install

RUN git clone https://github.com/kcakdemir/HiCPlotter \
    && rm -rf HiCPlotter/data
RUN git clone https://github.com/rnakato/HiC-Pro \
    && cd HiC-Pro  \
    && make CONFIG_SYS=config-install.docker.txt configure \
    && make CONFIG_SYS=config-install.docker.txt install

RUN rm -rf HiC-Pro_2.10.0/annotation/
COPY annotation HiC-Pro_2.10.0/annotation/
COPY rnakatoscript rnakatoscript

#COPY pastis pastis/rnakatoscript/

CMD ["/bin/bash"]