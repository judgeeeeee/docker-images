FROM cargo-infra.caicloud.xyz/devops_release/anaconda:v5.2.0-py36-gpu

# Install tensorflow-1.12.0 and keras-2.2.2
RUN /bin/bash -c "conda create -n tf-py36 python=3.6 ipykernel && \
    source activate tf-py36 && \
    conda install -y -c menpo opencv opencv3 && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir tensorflow-gpu==1.12.0 keras tflearn tensorlayer && \
    conda clean -ya && \
    python -m ipykernel install --user --name tf-py36 --display-name TensorFlow-v1.12-py36 "

RUN /bin/bash -c "conda create -n tf-py27 python=2.7 ipykernel && \
    source activate tf-py27 && \
    conda install -y -c menpo opencv opencv3 && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir tensorflow-gpu==1.12.0 keras tflearn tensorlayer && \
    conda clean -ya && \
    python -m ipykernel install --user --name tf-py27 --display-name TensorFlow-v1.12-py27 "

# Install pytorch-1.1.0
RUN /bin/bash -c "conda create -n pytorch-py36 python=3.6 ipykernel && \
    source activate pytorch-py36 && \
    conda install -y -c menpo opencv opencv3 && \
    conda insatll -c caffe2 lmdb python-lmdb && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    conda install -y pytorch==1.1.0 torchvision cudatoolkit=9.0 -c pytorch && \
    conda clean -ya && \
    python -m ipykernel install --user --name pytorch-py36 --display-name PyTorch-v1.1.0-py36 "
RUN /bin/bash -c "conda create -n pytorch-py27 python=2.7 ipykernel && \
    source activate pytorch-py27 && \
    conda install -y -c menpo opencv opencv3 && \
    conda insatll -c caffe2 lmdb python-lmdb && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    conda install -y pytorch==1.1.0 torchvision cudatoolkit=9.0 -c pytorch && \
    conda clean -ya && \
    python -m ipykernel install --user --name pytorch-py27 --display-name PyTorch-v1.1.0-py27 "

# Install mxnet 1.4.0
RUN /bin/bash -c "conda create -n mxnet-py36 python=3.6 ipykernel && \
    source activate mxnet-py36 && \
    conda install -y -c menpo opencv opencv3 && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir mxnet-cu90==1.4.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name mxnet-py36 --display-name MXNet-v1.4.0-py36 "
RUN /bin/bash -c "conda create -n mxnet-py27 python=2.7 ipykernel && \
    source activate mxnet-py27 && \
    conda install -y -c menpo opencv opencv3 && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir mxnet-cu90==1.4.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name mxnet-py27 --display-name MXNet-v1.4.0-py27 "

# Install caffe 1.0.0
RUN /bin/bash -c "conda create -n caffe-py36 python=3.6 ipykernel && \
    source activate caffe-py36 && \
    conda install -y caffe-gpu==1.0 && \
    conda install -y -c menpo opencv opencv3 && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py36 --display-name Caffe-v1.0-py36 "
RUN /bin/bash -c "conda create -n caffe-py27 python=2.7 ipykernel && \
    source activate caffe-py27 && \
    conda install -y caffe-gpu==1.0 && \
    conda install -y -c menpo opencv opencv3 && \
    conda install -y  numpy scipy matplotlib pandas nltk gensim scikit-learn mkl && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py27 --display-name Caffe-v1.0-py27 "

# Set up notebook config.
RUN wget http://infra-clever.oss-cn-hangzhou.aliyuncs.com/tensorflow/jupyter_deps/jupyter_notebook_config.py -P /root/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_remote_access = True" >> /root/.jupyter/jupyter_notebook && \
    # install jupyterLab extension
    conda install -y ipywidgets && \
    jupyter labextension install jupyterlab-drawio && \
    jupyter labextension install @jupyterlab/toc && \
    jupyter labextension install @oriolmirosa/jupyterlab_materialdarker && \
    # Integrate tensorboard
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir tensorflow jupyter-tensorboard && jupyter labextension install jupyterlab_tensorboard 

WORKDIR /notebooks

#Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set locale
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"

# Hide native Python3 ipykernel.
CMD [ "jupyter", "notebook", "--KernelSpecManager.ensure_native_kernel=False"]
