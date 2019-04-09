FROM ubuntu:bionic

MAINTAINER Stefan Weiberg <stefan.weiberg@suse.com>

# Install some basic packages
RUN apt-get update && apt-get install -y \
    apt-utils \
    build-essential \
    git \
    gdb \
    fakeroot \
    libkrb5-dev \
    graphviz \
    wget \
    vim \
    git \
    openjdk-8-jdk \
    qt5-default \
    libkf5plasma-dev \
 && rm -rf /var/lib/apt/lists/*

# Install LibreOffice dependencies
RUN apt-get update && apt-get build-dep -y libreoffice \
 && rm -rf /var/lib/apt/lists/*
