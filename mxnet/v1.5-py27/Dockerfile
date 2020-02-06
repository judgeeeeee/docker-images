FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py27

# Install mxnet
ARG MXNET_VERSION=1.5
ARG MXNET_TYPE=mxnet

## Install horovod with mxnet
ARG HOROVOD_VERSION=0.16

RUN HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir ${MXNET_TYPE}==${MXNET_VERSION} horovod==${HOROVOD_VERSION}
