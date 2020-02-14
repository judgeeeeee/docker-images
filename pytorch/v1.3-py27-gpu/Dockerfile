FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py27-gpu

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
RUN conda install pytorch=1.3.1 torchvision cudatoolkit=10.0 -c pytorch && conda clean -ya

## Install horovod with pytorch
ARG HOROVOD_VERSION=0.16.4
# RUN HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION}

RUN ldconfig /usr/local/cuda-10.0/targets/x86_64-linux/lib/stubs && \
    HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION} transformers==2.3.0 python-levenshtein && \
    ldconfig
