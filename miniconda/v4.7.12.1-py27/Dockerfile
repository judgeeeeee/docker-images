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
    libpng-dev \
    libprotobuf-dev \
    libsnappy-dev \
    libxcomposite1 \
    libxcursor1 \
    libxi6 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    openssh-client \
    openssh-server \
    protobuf-compiler \
    # For horovod
    g++-4.9 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Open MPI
RUN mkdir /tmp/openmpi && \
    cd /tmp/openmpi && \
    wget https://www.open-mpi.org/software/ompi/v4.0/downloads/openmpi-4.0.2.tar.gz && \
    tar zxf openmpi-4.0.0.tar.gz && \
    cd openmpi-4.0.0 && \
    ./configure --enable-orterun-prefix-by-default && \
    make -j $(nproc) all && \
    make install && \
    ldconfig && \
    rm -rf /tmp/openmpi

# Create a wrapper for OpenMPI to allow running as root by default
# ref https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile.mkl-horovod#L86
RUN mv /usr/bin/mpirun /usr/bin/mpirun.real && \
    echo 'mpirun.real --allow-run-as-root "$@"' >> /usr/bin/mpirun && \
    chmod a+x /usr/bin/mpirun

# Configure OpenMPI to run good defaults:
RUN echo "btl_tcp_if_exclude = lo,docker0" >> /etc/openmpi/openmpi-mca-params.conf

# Allow OpenSSH to talk to containers without asking for confirmation
RUN mkdir -p /var/run/sshd && \
    cat /etc/ssh/ssh_config | grep -v StrictHostKeyChecking > /etc/ssh/ssh_config.new && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config.new && \
    mv /etc/ssh/ssh_config.new /etc/ssh/ssh_config

# https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN curl -o ~/miniconda2.sh -O https://repo.continuum.io/miniconda/Miniconda2-4.7.12.1-Linux-x86_64.sh && \
    chmod +x ~/miniconda2.sh && \
    ~/miniconda2.sh -b -p /opt/conda && \
    rm ~/miniconda2.sh && \
    /opt/conda/bin/conda config --set show_channel_urls yes && \
    /opt/conda/bin/conda install python=2.7 conda-build && \
    /opt/conda/bin/conda install pillow=6.2.1 gxx_linux-64 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    /opt/conda/bin/conda install opencv3 -c menpo && \
    /opt/conda/bin/conda clean -ya

# Set path
ENV PATH /opt/conda/bin:$PATH

# http://bugs.python.org/issue19846
ENV LANG C.UTF-8
