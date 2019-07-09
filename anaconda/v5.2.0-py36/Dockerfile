FROM ubuntu:16.04

RUN apt-get update  && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    libjpeg-dev \
    libpng-dev \
    libgl1-mesa-glx \
    curl wget vim git \
    # For horovod
    gcc-4.9 g++-4.9 gcc-4.9-base \
    # For MPI
    openssh-client openssh-server \
    openmpi-bin openmpi-doc libopenmpi-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Anaconda3-5.2.0 built-in with python3.7
RUN curl -o ~/conda.sh -O  https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh && \
    chmod +x ~/conda.sh && \
    ~/conda.sh -b -p /opt/conda && \
    /opt/conda/bin/conda update -n base -c defaults conda && \
    rm ~/conda.sh && \
    /opt/conda/bin/conda clean -ya
# Set path
ENV PATH /opt/conda/bin:$PATH
