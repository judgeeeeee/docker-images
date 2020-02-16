FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36-gpu

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
