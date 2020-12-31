FROM ubuntu:18.04

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y locales tzdata \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    automake \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    debconf \
    debhelper \
    dpkg \
    git \
    gnupg \
    gobject-introspection \
    libexpat1-dev \
    libglib2.0-dev \
    mc \
    pkg-config \
    software-properties-common \
    sudo \
    wget

COPY my-private-key.asc /tmp/my-private-key.asc
RUN gpg --import /tmp/my-private-key.asc

WORKDIR /root/builder

CMD ["tail", "-F", "/dev/null"]
