FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36-gpu

# Install caffe-gpu
# see https://github.com/conda/conda/issues/8197
RUN conda config --set channel_priority strict && \
    conda install caffe-gpu==1.0 -c anaconda && \
    conda clean -ya
