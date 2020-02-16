FROM ubuntu:16.04

RUN apt-get update  && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake curl wget vim git \
    graphviz \
    libasound2 \
    libegl1-mesa \
    libgflags-dev \
    libgl1-mesa-glx \
    libgomp1 \
    libgoogle-glog-dev \
    libgtest-dev \
    libiomp-dev \
    libjpeg-dev \
    libleveldb-dev \
    liblmdb-dev \
    libopencv-dev \
    libopenmpi-dev \
    libpng-dev \
    libprotobuf-dev \
    libsnappy-dev \
    libxcomposite1 \
    libxcursor1 \
    libxi6 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    openmpi-bin \
    openmpi-doc \
    openssh-client \
    openssh-server \
    protobuf-compiler \
    # For horovod
    g++-4.9 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN curl -o ~/miniconda3.sh -O https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh && \
    chmod +x ~/miniconda3.sh && \
    ~/miniconda3.sh -b -p /opt/conda && \
    rm ~/miniconda3.sh && \
    /opt/conda/bin/conda config --set show_channel_urls yes && \
    /opt/conda/bin/conda install python=3.6 conda-build && \
    /opt/conda/bin/conda install pillow=6.2.1 gxx_linux-64 tqdm absl-py cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    /opt/conda/bin/conda install opencv3 -c menpo && \
    /opt/conda/bin/conda clean -ya

# Set path
ENV PATH /opt/conda/bin:$PATH
