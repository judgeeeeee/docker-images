FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py27-gpu

# Install mxnet
ARG MXNET_VERSION=1.5.1
ARG MXNET_TYPE=mxnet-cu100
RUN pip install --no-cache-dir ${MXNET_TYPE}==${MXNET_VERSION}

## Install horovod with mxnet
ARG HOROVOD_VERSION=0.18.2
RUN ldconfig /usr/local/cuda-10.0/targets/x86_64-linux/lib/stubs && \
    HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_WITH_MXNET=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION} && \
    ldconfig
