FROM cargo-infra.caicloud.xyz/devops_release/anaconda:v5.2.0-py27-gpu

# Install caffe-gpu
# see https://github.com/conda/conda/issues/8197
RUN conda config --set channel_priority strict && \
    conda install caffe-gpu==1.0 -c anaconda && \
    conda clean -ya
