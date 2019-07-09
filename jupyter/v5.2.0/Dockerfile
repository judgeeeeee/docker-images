FROM cargo-infra.caicloud.xyz/devops_release/anaconda:v5.2.0-py36

# Create and activate tf-py36 virtual env
# Install tensorflow-1.12.0 and keras-2.2.2
RUN /bin/bash -c "conda create -n tf-py36 python=3.6 ipykernel && \
    source activate tf-py36 && \
    pip --no-cache-dir install tensorflow==1.12.0 \
    keras \
    && \
    python -m ipykernel install --user --name tf-py36 --display-name \"TensorFlow-Keras-py36\" "

RUN /bin/bash -c "conda create -n tf-py27 python=2.7 ipykernel && \
    source activate tf-py27 && \
    pip --no-cache-dir install tensorflow==1.12.0 \
    keras \
    && \
    python -m ipykernel install --user --name tf-py27 --display-name \"TensorFlow-Keras-py27\" "

# Install pytorch-1.1.0
RUN /bin/bash -c "conda create -n pytorch-py36 python=3.6 ipykernel && \
    source activate pytorch-py36 && \
    conda install pytorch-cpu==1.1.0 torchvision-cpu -c pytorch && \
    conda clean -ya && \
    python -m ipykernel install --user --name pytorch-py36 --display-name \"PyTorch-py36\" "
RUN /bin/bash -c "conda create -n pytorch-py27 python=2.7 ipykernel && \
    source activate pytorch-py27 && \
    conda install pytorch-cpu==1.1.0 torchvision-cpu -c pytorch && \
    conda clean -ya && \
    python -m ipykernel install --user --name pytorch-py27 --display-name \"PyTorch-py27\" "

# Install mxnet 1.4.0
RUN /bin/bash -c "conda create -n mxnet-py36 python=3.6 ipykernel && \
    source activate mxnet-py36 && \
    pip install --no-cache-dir mxnet==1.4.0 && \
    python -m ipykernel install --user --name mxnet-py36 --display-name \"MXNet-py36\" "
RUN /bin/bash -c "conda create -n mxnet-py27 python=2.7 ipykernel && \
    source activate mxnet-py27 && \
    pip install --no-cache-dir mxnet==1.4.0 && \
    python -m ipykernel install --user --name mxnet-py27 --display-name \"MXNet-py27\" "

# Install caffe 1.0.0
RUN /bin/bash -c "conda create -n caffe-py36 python=3.6 ipykernel && \
    source activate caffe-py36 && \
    conda install caffe==1.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py36 --display-name \"Caffe-py36\" "
RUN /bin/bash -c "conda create -n caffe-py27 python=2.7 ipykernel && \
    source activate caffe-py27 && \
    conda install caffe==1.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py27 --display-name \"Caffe-py27\" "

# Set up notebook config.
RUN wget http://infra-clever.oss-cn-hangzhou.aliyuncs.com/tensorflow/jupyter_deps/jupyter_notebook_config.py -P /root/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_remote_access = True" >> /root/.jupyter/jupyter_notebook

WORKDIR /notebooks

#Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set locale
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"

# Hide native Python3 ipykernel.
CMD [ "jupyter", "notebook", "--KernelSpecManager.ensure_native_kernel=False"]
