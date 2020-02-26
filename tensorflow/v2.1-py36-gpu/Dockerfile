FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36-gpu

# Install tensorflow & keras
ARG TENSORFLOW_VERSION=2.1
ARG TENSORFLOW_TYPE=tensorflow
RUN pip install --no-cache-dir keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION}
# bug: conda-tensorflow has conflict with openmpi
# RUN conda install keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION} && \
#    conda clean -ya

# Install horovod with tensorflow
#ARG HOROVOD_VERSION=0.19.0
#RUN ldconfig /usr/local/cuda/targets/x86_64-linux/lib/stubs && \
#    HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL HOROVOD_WITH_TENSORFLOW=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION} && \
#    ldconfig
