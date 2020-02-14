FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36-gpu

# Install tensorflow-1.14 and keras
RUN /bin/bash -c "conda create -n tf-py36 python=3.6 ipykernel && \
    source activate tf-py36 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    pip install --no-cache-dir tensorflow-gpu==1.14 keras tflearn && \
    conda clean -ya && \
    python -m ipykernel install --user --name tf-py36 --display-name TensorFlow-v1.14-py36 "

RUN /bin/bash -c "conda create -n tf-py27 python=2.7 ipykernel && \
    source activate tf-py27 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    pip install --no-cache-dir tensorflow-gpu==1.14 keras tflearn && \
    conda clean -ya && \
    python -m ipykernel install --user --name tf-py27 --display-name TensorFlow-v1.14-py27 "

# Install pytorch-1.3.1
RUN /bin/bash -c "conda create -n pytorch-py36 python=3.6 ipykernel && \
    source activate pytorch-py36 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c caffe2 lmdb python-lmdb && \
    conda install -c menpo opencv3 && \
    conda install pytorch==1.3.1 torchvision cudatoolkit=10.0 -c pytorch && \
    conda clean -ya && \
    pip install --no-cache-dir transformers==2.3.0 python-levenshtein && \
    python -m ipykernel install --user --name pytorch-py36 --display-name PyTorch-v1.3-py36 "
RUN /bin/bash -c "conda create -n pytorch-py27 python=2.7 ipykernel && \
    source activate pytorch-py27 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c caffe2 lmdb python-lmdb && \
    conda install -c menpo opencv3 && \
    conda install pytorch==1.3.1 torchvision cudatoolkit=10.0 -c pytorch && \
    conda clean -ya && \
    pip install --no-cache-dir transformers==2.3.0 python-levenshtein && \
    python -m ipykernel install --user --name pytorch-py27 --display-name PyTorch-v1.3-py27 "

# Install mxnet 1.5
RUN /bin/bash -c "conda create -n mxnet-py36 python=3.6 ipykernel && \
    source activate mxnet-py36 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda clean -ya && \
    pip install --no-cache-dir mxnet-cu100==1.5.1 && \
    python -m ipykernel install --user --name mxnet-py36 --display-name MXNet-v1.5-py36 "
RUN /bin/bash -c "conda create -n mxnet-py27 python=2.7 ipykernel && \
    source activate mxnet-py27 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda clean -ya && \
    pip install --no-cache-dir mxnet-cu100==1.5.1 && \
    python -m ipykernel install --user --name mxnet-py27 --display-name MXNet-v1.5-py27 "

# Install caffe 1.0
RUN /bin/bash -c "conda create -n caffe-py36 python=3.6 ipykernel && \
    source activate caffe-py36 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda install caffe-gpu==1.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py36 --display-name Caffe-v1.0-py36 "
RUN /bin/bash -c "conda create -n caffe-py27 python=2.7 ipykernel && \
    source activate caffe-py27 && \
    conda install pillow=6.2.1 tqdm absl-py future cffi cmake flask gensim graphviz hypothesis leveldb matplotlib mkl mkl-include ninja nltk numpy pandas protobuf pydot pyyaml requests scikit-image scikit-learn scipy setuptools tornado typing && \
    conda install -c menpo opencv3 && \
    conda install caffe-gpu==1.0 && \
    conda clean -ya && \
    python -m ipykernel install --user --name caffe-py27 --display-name Caffe-v1.0-py27 "

# Set up notebook config.
RUN /bin/bash -c "source deactivate" && \
    wget http://infra-clever.oss-cn-hangzhou.aliyuncs.com/tensorflow/jupyter_deps/jupyter_notebook_config.py -P /root/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_remote_access = True" >> /root/.jupyter/jupyter_notebook && \
    # install jupyterLab extension
    conda install nodejs jupyter jupyterlab -c conda-forge && \
    conda install -c conda-forge ipywidgets jupyter_contrib_nbextensions jupyter_nbextensions_configurator && \
    # npm config set registry https://registry.npm.taobao.org && \
    conda clean -ya

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install jupyterlab-drawio && \
    jupyter labextension install @jupyterlab/plotly-extension && \
    jupyter labextension install @jupyterlab/toc && \
    # Integrate tensorboard
    pip install --no-cache-dir --ignore-installed --upgrade pip wrapt && \
    pip install --no-cache-dir tensorflow jupyter-tensorboard && jupyter labextension install jupyterlab_tensorboard && \
    # Integrate git
    pip install --upgrade --no-cache-dir jupyterlab-git  && jupyter lab build && \
    # Integrate nvdashboard
    pip install --upgrade --no-cache-dir jupyterlab-nvdashboard && jupyter labextension install jupyterlab-nvdashboard

WORKDIR /notebooks

#Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Set locale
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"

# Hide native Python3 ipykernel.
CMD [ "jupyter", "notebook", "--KernelSpecManager.ensure_native_kernel=False"]
