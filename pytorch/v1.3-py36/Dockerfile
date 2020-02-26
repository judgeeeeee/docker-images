FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36

# Install pytorch
RUN conda install pytorch==1.3.1 torchvision cpuonly -c pytorch && conda clean -ya

## Install horovod with pytorch
ARG HOROVOD_VERSION=0.19.0
RUN HOROVOD_WITH_PYTORCH=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION} transformers==2.3.0 python-levenshtein
