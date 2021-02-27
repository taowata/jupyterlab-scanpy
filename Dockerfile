FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim
WORKDIR /opt
RUN wget https://repo.continuum.io/archive/Anaconda3-2020.11-Linux-x86_64.sh && \
    sh /opt/Anaconda3-2020.11-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2020.11-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
# Specify the version of scanpy to install. https://github.com/theislab/scanpy/issues/1579
RUN pip install --upgrade pip && pip install scanpy==1.7.0 \
                                             seaborn==0.10.1 \
                                             leidenalg \
                                             louvain==0.7.0
WORKDIR /work
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
