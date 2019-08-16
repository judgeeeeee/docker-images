FROM cargo-infra.caicloud.xyz/devops_release/anaconda:v5.2.0-py27

# http://bugs.python.org/issue19846
ENV LANG C.UTF-8

## Create a wrapper for OpenMPI to allow running as root by default
## ref https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile.mkl-horovod#L86
RUN mv /usr/bin/mpirun /usr/bin/mpirun.real && \
    echo 'mpirun.real --allow-run-as-root "$@"' >> /usr/bin/mpirun && \
    chmod a+x /usr/bin/mpirun

## Configure OpenMPI to run good defaults:
RUN echo "btl_tcp_if_exclude = lo,docker0" >> /etc/openmpi/openmpi-mca-params.conf

## Allow OpenSSH to talk to containers without asking for confirmation
RUN mkdir -p /var/run/sshd && \
    cat /etc/ssh/ssh_config | grep -v StrictHostKeyChecking > /etc/ssh/ssh_config.new && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config.new && \
    mv /etc/ssh/ssh_config.new /etc/ssh/ssh_config

# Install pytorch
RUN conda install future cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c caffe2 lmdb python-lmdb && \
    conda install -c menpo opencv3 && \
    git clone https://github.com/pytorch/pytorch.git && \
    cd pytorch && git checkout v1.1.0    && \
    # if you are updating an existing checkout
    git submodule sync && \
    git submodule update --init --recursive && \
    export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"} && \
    export USE_CUDA=0 && \
    export USE_CUDNN=0 && \
    export USE_LMDB=1 && \
    export USE_LEVELDB=1 && \
    export USE_OPENMP=1 && \
    export BUILD_CAFFE2_OPS=1 && \
    export USE_FFMPEG=1 && \
    export USE_FBGEMM=1 && \
    export BUILD_BINARY=1 && \
    export USE_REDIS=1 && \
    export USE_DISTRIBUTED=1 && \
    python setup.py install && \
    conda clean -ya && \
    cd ../ && rm -rf pytorch && \
    # Install torchversion
    git clone https://github.com/pytorch/vision.git && \
    cd vision && git checkout v0.3.0 && \
    FORCE_CUDA=0 python setup.py install && \
    cd ../ && rm -rf vision

## Install horovod with tensorflow
ARG HOROVOD_VERSION=0.16.1
RUN HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION}
