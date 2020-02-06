FROM cargo-infra.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py27

# Install mxnet
ARG MXNET_VERSION=1.5.1
ARG MXNET_TYPE=mxnet
RUN pip install --no-cache-dir ${MXNET_TYPE}==${MXNET_VERSION}

## Install horovod with mxnet
ARG HOROVOD_VERSION=0.16.4
RUN HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION}
