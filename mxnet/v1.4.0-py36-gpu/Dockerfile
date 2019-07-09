FROM cargo-infra.caicloud.xyz/devops_release/anaconda:v5.2.0-py36-gpu

# Install mxnet
ARG MXNET_VERSION=1.4.0
ARG MXNET_TYPE=mxnet-cu90

RUN pip install --no-cache-dir ${MXNET_TYPE}==${MXNET_VERSION}
