FROM cargo-infra.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36-gpu

# Install mxnet
ARG MXNET_VERSION=1.5.1
ARG MXNET_TYPE=mxnet-cu101

RUN pip install --no-cache-dir ${MXNET_TYPE}==${MXNET_VERSION}
