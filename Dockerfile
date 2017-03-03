FROM ubuntu:yakkety
MAINTAINER Cameron Mullen <cam@skio.io>

ENV CLANG_VERSION 3.9
ENV GCC_VERSION 5
ENV XAR_VERSION 1.6.1
ENV MINGW_W64_VERSION 5.0.1



RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
      apt-utils \
      autoconf \
      autogen \
      automake \
      bash \
      binutils \
      bison \
      bzip2 \
      ca-certificates \
      clang-$CLANG_VERSION \
      cmake \
      curl \
      doxygen \
      dpkg-dev \
      flex \
      fuse \
      g++-$GCC_VERSION \
      gcc-$GCC_VERSION \
      git \
      gnupg \
      gobjc++-$GCC_VERSION \
      gperf \
      gzip \
      lbzip2 \
      libbz2-dev \
      libc6-dev \
      libclang-common-$CLANG_VERSION-dev \
      libclang-$CLANG_VERSION-dev \
      libcloog-ppl-dev \
      libcrypto++-dev \
      libgmp-dev \
      liblzma-dev \
      libmpc-dev \
      libmpfr-dev \
      libpopt-dev \
      libssl-dev \
      libtool \
      libxml2-dev \
      liblldb-$CLANG_VERSION \
      liblldb-$CLANG_VERSION-dbg \
      liblldb-$CLANG_VERSION-dev \
      lldb-$CLANG_VERSION \
      llvm-$CLANG_VERSION \
      llvm-$CLANG_VERSION-dev \
      make \
      openjdk-8-jdk-headless \
      patch \
      perl \
      ppl-dev \
      python \
      python-software-properties \
      python3 \
      software-properties-common \
      tar \
      uuid-dev \
      wget \
      zlib1g-dev


#RUN mkdir -p /tmp/xar && \
#    cd /tmp/xar && \
#    apt-get install -y --no-install-recommends --no-install-suggests \
#    wget -O xar.tar.gz https://github.com/downloads/mackyle/xar/xar-1.6.1.tar.gz && \
#    tar -xzf xar.tar.gz -C . --strip-components=1 && \
#    ./configure && \
#    make && \
#    make install && \
#    cd / && \
#    rm -rf /tmp/xar
#
#RUN mkdir -p /osxcross && \
#    cd /osxcross && \
#    git clone https://github.com/tpoechtrager/cctools-port.git && \
#    cd cctools-port/cctools && \
#    ./autogen.sh && \
#    ./configure --prefix=/osxcross/cctools-port/bin --target=x86_64-apple-darwin11 && \
#    make && \
#    make install


# RUN git clone https://github.com/tpoechtrager/osxcross.git && \



# Install XCode
# https://github.com/tpoechtrager/osxcross#packaging-the-sdk

# Install crosstool ng
# http://crosstool-ng.org/#other_systems

# Ruby
# Mingw64
