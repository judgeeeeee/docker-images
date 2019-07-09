FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN apt-get update --fix-missing  && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    libjpeg-dev \
    libpng-dev \
    curl \
    wget \
    vim \
    # For horovod
    gcc-4.9 g++-4.9 gcc-4.9-base \
    # For MPI
    openssh-client openssh-server \
    openmpi-bin openmpi-doc libopenmpi-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Anaconda2-5.2.0 built-in with python2.7
RUN curl -o ~/conda.sh -O  https://repo.continuum.io/archive/Anaconda2-5.2.0-Linux-x86_64.sh && \
    chmod +x ~/conda.sh && \
    ~/conda.sh -b -p /opt/conda && \
    /opt/conda/bin/conda update -n base -c defaults conda && \
    rm ~/conda.sh && \
    /opt/conda/bin/conda clean -ya

# Set path
ENV PATH /opt/conda/bin:$PATH
