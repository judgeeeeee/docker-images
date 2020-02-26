FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py27

# Install tensorflow & keras
ARG TENSORFLOW_VERSION=1.14
ARG TENSORFLOW_TYPE=tensorflow
RUN pip install --no-cache-dir keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION}
# bug: conda-tensorflow has conflict with openmpi
# RUN conda install keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION} && \
#    conda clean -ya

# Install horovod with tensorflow
ARG HOROVOD_VERSION=0.19.0
RUN HOROVOD_WITH_TENSORFLOW=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION}
