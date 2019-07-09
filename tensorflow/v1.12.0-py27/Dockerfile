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

# Install tensorflow & keras
ARG TENSORFLOW_VERSION=1.12.0
ARG TENSORFLOW_TYPE=tensorflow
RUN pip install --no-cache-dir keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION}
# bug: conda-tensorflow has conflict with openmpi
#RUN conda install keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION} && \
#    conda clean -ya

# Install Horovod
## Pin GCC to 4.9 (priority 200) to compile correctly against TensorFlow, PyTorch, and MXNet.
## Backup existing GCC installation as priority 100, so that it can be recovered later.
RUN update-alternatives --install /usr/bin/gcc gcc $(readlink -f $(which gcc)) 100 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc $(readlink -f $(which gcc)) 100 && \
    update-alternatives --install /usr/bin/g++ g++ $(readlink -f $(which g++)) 100 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-g++ x86_64-linux-gnu-g++ $(readlink -f $(which g++)) 100
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 200 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc /usr/bin/gcc-4.9 200 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 200 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-g++ x86_64-linux-gnu-g++ /usr/bin/g++-4.9 200

## Install horovod with tensorflow
ARG HOROVOD_VERSION=0.16.1
RUN HOROVOD_WITH_TENSORFLOW=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION}

## Remove GCC pinning
RUN update-alternatives --remove gcc /usr/bin/gcc-4.9 && \
    update-alternatives --remove x86_64-linux-gnu-gcc /usr/bin/gcc-4.9 && \
    update-alternatives --remove g++ /usr/bin/g++-4.9 && \
    update-alternatives --remove x86_64-linux-gnu-g++ /usr/bin/g++-4.9
