FROM 763104351884.dkr.ecr.us-west-2.amazonaws.com/huggingface-pytorch-training:1.13.1-transformers4.26.0-gpu-py39-cu117-ubuntu20.04

ENV PATH="/opt/ml/code:${PATH}"

ENV DEBIAN_FRONTEND noninteractive
RUN apt -y update \
    && mkdir -p /opt/ml/code \
    && mkdir -p /opt/ml/input/data/AdvertiseGen/

COPY ./ChatGLM-6B/ptuning/ /opt/ml/code/
COPY ./AdvertiseGen/*.json /opt/ml/input/data/AdvertiseGen/

RUN chmod +x /opt/ml/code/*.sh \
    && pip3 install -r /opt/ml/code/requirements.txt
    
WORKDIR /opt/ml/code

ENTRYPOINT []