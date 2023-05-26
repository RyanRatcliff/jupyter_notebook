FROM jupyter/all-spark-notebook:ubuntu-22.04
USER root
RUN apt update
RUN apt-get upgrade -y 
RUN apt-get install -y git wget build-essential unzip graphviz libgraphviz-dev pkg-config swig libx11-dev libgsl0-dev libopenblas-dev liblapacke-dev bwa samtools bcftools
RUN apt install -y python3.10
RUN apt install -y vim python3-boto3 
RUN pip install boto3 humanize plotly pandas numpy beautifulsoup4 scikit-learn keras nltk textblob
RUN python -m nltk.downloader all
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN rm awscliv2.zip
RUN sudo ./aws/install
RUN rm -r aws
ENV PASSWORD=password   
ENV JUPYTER_ENABLE_LAB=yes
ENV WORK=/home/jovyan
WORKDIR /home/jovyan
