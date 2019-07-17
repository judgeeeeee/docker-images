FROM cargo-infra.caicloud.xyz/devops_release/anaconda:v5.2.0-py36

# Install tensorflow-1.12.0 and keras-2.2.2
RUN /bin/bash -c "conda create -n tf-py36 python=3.6 ipykernel && \
    source activate tf-py36 && \
    conda install cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    pip install --no-cache-dir tensorflow==1.12.0 keras tflearn && \
    conda clean -ya && \
    python -m ipykernel install --user --name tf-py36 --display-name TensorFlow-v1.12-py36 "

RUN /bin/bash -c "conda create -n tf-py27 python=2.7 ipykernel && \
    source activate tf-py27 && \
    conda install cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    pip install --no-cache-dir tensorflow==1.12.0 keras tflearn && \
    conda clean -ya && \
    python -m ipykernel install --user --name tf-py27 --display-name TensorFlow-v1.12-py27 "

# Install pytorch-1.1.0
RUN /bin/bash -c "conda create -n pytorch-py36 python=3.6 ipykernel && \
    source activate pytorch-py36 && \
    conda install future cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c caffe2 lmdb python-lmdb && \
    conda install -c menpo opencv3 && \
    git clone https://github.com/pytorch/pytorch.git && \
    cd pytorch && git checkout v1.1.0    && \
    # if you are updating an existing checkout
    git submodule sync && \
    git submodule update --init --recursive && \
    export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"} && \
    export USE_CUDA=0 && \
    export USE_CUDNN=0 && \
    export USE_LMDB=1 && \
    export USE_LEVELDB=1 && \
    export USE_OPENMP=1 && \
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
    cd vision && git checkout v0.3.0 && \
    FORCE_CUDA=0 python setup.py install && \
    cd ../ && rm -rf vision && \
    python -m ipykernel install --user --name pytorch-py36 --display-name PyTorch-v1.1.0-py36 "
RUN /bin/bash -c "conda create -n pytorch-py27 python=2.7 ipykernel && \
    source activate pytorch-py27 && \
    conda install future cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c caffe2 lmdb python-lmdb && \
    conda install -c menpo opencv3 && \
    git clone https://github.com/pytorch/pytorch.git && \
    cd pytorch && git checkout v1.1.0    && \
    # if you are updating an existing checkout
    git submodule sync && \
    git submodule update --init --recursive && \
    export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"} && \
    export USE_CUDA=0 && \
    export USE_CUDNN=0 && \
    export USE_LMDB=1 && \
    export USE_LEVELDB=1 && \
    export USE_OPENMP=1 && \
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
    cd vision && git checkout v0.3.0 && \
    FORCE_CUDA=0 python setup.py install && \
    cd ../ && rm -rf vision && \
    python -m ipykernel install --user --name pytorch-py27 --display-name PyTorch-v1.1.0-py27 "

# Install mxnet 1.4.0
RUN /bin/bash -c "conda create -n mxnet-py36 python=3.6 ipykernel && \
    source activate mxnet-py36 && \
    conda install cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda clean -ya && \
    pip install --no-cache-dir mxnet==1.4.0 && \
    python -m ipykernel install --user --name mxnet-py36 --display-name MXNet-v1.4.0-py36 "
RUN /bin/bash -c "conda create -n mxnet-py27 python=2.7 ipykernel && \
    source activate mxnet-py27 && \
    conda install cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda clean -ya && \
    pip install --no-cache-dir mxnet==1.4.0 && \
    python -m ipykernel install --user --name mxnet-py27 --display-name MXNet-v1.4.0-py27 "

# Install caffe 1.0.0
RUN /bin/bash -c "conda create -n caffe-py36 python=3.6 ipykernel && \
    source activate caffe-py36 && \
    conda install cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda install caffe==1.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py36 --display-name Caffe-v1.0-py36 "
RUN /bin/bash -c "conda create -n caffe-py27 python=2.7 ipykernel && \
    source activate caffe-py27 && \
    conda install cffi cmake flask gensim graphviz hypothesis jupyter jupyterlab leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda install caffe==1.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py27 --display-name Caffe-v1.0-py27 "

# Set up notebook config.
RUN /bin/bash -c "source deactivate" && \
    wget http://infra-clever.oss-cn-hangzhou.aliyuncs.com/tensorflow/jupyter_deps/jupyter_notebook_config.py -P /root/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_remote_access = True" >> /root/.jupyter/jupyter_notebook && \
    # install jupyterLab extension
    conda install nodejs && \
    conda update jupyter jupyterlab -c conda-forge && \
    conda install -c conda-forge ipywidgets jupyter_contrib_nbextensions jupyter_nbextensions_configurator && \
    npm config set registry https://registry.npm.taobao.org && \
    conda clean -ya

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyterlab-drawio && \
    jupyter labextension install @jupyterlab/plotly-extension && \
    jupyter labextension install @jupyterlab/toc && \
    # Integrate tensorboard
    pip install --no-cache-dir --ignore-installed --upgrade pip wrapt && \
    pip install --no-cache-dir tensorflow jupyter-tensorboard && jupyter labextension install jupyterlab_tensorboard

WORKDIR /notebooks

#Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set locale
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"

# Hide native Python3 ipykernel.
CMD [ "jupyter", "notebook", "--KernelSpecManager.ensure_native_kernel=False"]
