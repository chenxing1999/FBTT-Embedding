# syntax = docker/dockerfile:experimental

FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y update && \
    apt install -y build-essential software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install -y python3 pip python3-dev

RUN ln -sfn /usr/bin/python3 /usr/bin/python && \
    ln -sfn /usr/bin/pip3 /usr/bin/pip

RUN  --mount=type=cache,target=/root/.cache/pip pip install torch

WORKDIR /mnt/lib 
COPY . .
RUN pip install .



