FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py27-gpu

# Install pytorch
RUN conda install pytorch=1.3.1 torchvision cudatoolkit=10.0 -c pytorch && conda clean -ya

## Install horovod with pytorch
ARG HOROVOD_VERSION=0.19.0
RUN ldconfig /usr/local/cuda/targets/x86_64-linux/lib/stubs && \
    HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION} transformers==2.3.0 python-levenshtein && \
    ldconfig
