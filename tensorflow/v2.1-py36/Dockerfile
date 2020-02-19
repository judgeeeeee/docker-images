FROM cargo.caicloud.xyz/devops_release/miniconda:v4.7.12.1-py36

# http://bugs.python.org/issue19846
ENV LANG C.UTF-8

# Create a wrapper for OpenMPI to allow running as root by default
# ref https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile.mkl-horovod#L86
RUN mv /usr/bin/mpirun /usr/bin/mpirun.real && \
    echo 'mpirun.real --allow-run-as-root "$@"' >> /usr/bin/mpirun && \
    chmod a+x /usr/bin/mpirun

# Configure OpenMPI to run good defaults:
RUN echo "btl_tcp_if_exclude = lo,docker0" >> /etc/openmpi/openmpi-mca-params.conf

# Allow OpenSSH to talk to containers without asking for confirmation
RUN mkdir -p /var/run/sshd && \
    cat /etc/ssh/ssh_config | grep -v StrictHostKeyChecking > /etc/ssh/ssh_config.new && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config.new && \
    mv /etc/ssh/ssh_config.new /etc/ssh/ssh_config

# Install tensorflow & keras
ARG TENSORFLOW_VERSION=2.1
ARG TENSORFLOW_TYPE=tensorflow
RUN pip install --no-cache-dir keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION}
# bug: conda-tensorflow has conflict with openmpi
# RUN conda install keras ${TENSORFLOW_TYPE}==${TENSORFLOW_VERSION} && \
#    conda clean -ya

#RUN apt-get update  && apt-get install -y --no-install-recommends g++-7 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install horovod with tensorflow
#ARG HOROVOD_VERSION=0.19.0
#RUN HOROVOD_WITH_TENSORFLOW=1 pip install --no-cache-dir horovod==${HOROVOD_VERSION}
