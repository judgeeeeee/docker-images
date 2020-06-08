FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36-gpu

# Install pytorch
RUN conda install -c caffe2 lmdb python-lmdb && \
    git clone https://github.com/pytorch/pytorch.git && \
    cd pytorch && git checkout v1.3.1    && \
    # if you are updating an existing checkout
    git submodule sync && \
    git submodule update --init --recursive && \
    export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"} && \
    export USE_CUDA=1 && \
    export USE_CUDNN=1 && \
    export USE_LMDB=1 && \
    export USE_LEVELDB=1 && \
    export USE_OPENMP=1 && \
    export USE_MKLDNN=1 && \
    export BUILD_CAFFE2_OPS=1 && \
    export USE_FFMPEG=1 && \
    export USE_FBGEMM=1 && \
    export BUILD_BINARY=1 && \
    export USE_REDIS=1 && \
    export USE_DISTRIBUTED=1 && \
    python setup.py install && \
    conda clean -ya && \
    cd ../ && rm -rf pytorch && \
    # Install torchversion
    git clone https://github.com/pytorch/vision.git && \
    cd vision && git checkout v0.4.2 && \
    FORCE_CUDA=1 python setup.py install && \
    cd ../ && rm -rf vision

## Install horovod with pytorch
ARG HOROVOD_VERSION=0.19.0
RUN ldconfig /usr/local/cuda/targets/x86_64-linux/lib/stubs && \
    HOROVOD_GPU_ALLREDUCE=NCCL HOROVOD_GPU_BROADCAST=NCCL HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION} transformers==2.5.1 python-levenshtein && \
    ldconfig
