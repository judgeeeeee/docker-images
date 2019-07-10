FROM ubuntu:16.04

RUN apt-get update  && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    libjpeg-dev \
    libpng-dev \
    libgl1-mesa-glx \
    libegl1-mesa \
    libxrandr2 \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libxi6 \
    libxtst6 \
    liblmdb-dev \
    libopencv-dev python-opencv \
    graphviz \
    curl wget vim git \
    # For horovod
    gcc-4.9 g++-4.9 gcc-4.9-base \
    # For MPI
    openssh-client openssh-server \
    openmpi-bin openmpi-doc libopenmpi-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Anaconda3-5.2.0 built-in with python3.6
RUN curl -o ~/anaconda.sh -O  https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.2.0-Linux-x86_64.sh  && \
    chmod +x ~/anaconda.sh && \
    ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    /opt/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ && \
    /opt/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ && \
    /opt/conda/bin/conda config --set show_channel_urls yes && \
    /opt/conda/bin/conda install conda-build && \
    /opt/conda/bin/conda update --all && \
    /opt/conda/bin/conda clean -ya

# Set path
ENV PATH /opt/conda/bin:$PATH
