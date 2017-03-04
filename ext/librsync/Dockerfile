FROM ubuntu:yakkety
MAINTAINER Cameron Mullen <cam@skio.io>

ENV CLANG_VERSION 3.9
ENV GCC_VERSION 5
ENV XAR_VERSION 1.6.1
ENV MINGW_W64_VERSION 5.0.1
ENV RUBY_VERSION 2.4.0



RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests apt-utils && \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
      autoconf \
      autogen \
      automake \
      bash \
      binutils \
      bison \
      bzip2 \
      ca-certificates \
      cmake \
      curl \
      doxygen \
      dpkg-dev \
      flex \
      fuse \
      g++-$GCC_VERSION \
      gcc-$GCC_VERSION \
      gobjc++-$GCC_VERSION \
      git \
      gnupg \
      gobjc \
      gperf \
      gzip \
      lbzip2 \
      libbz2-dev \
      libc6-dev \
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
      llvm-$CLANG_VERSION \
      liblldb-$CLANG_VERSION \
      liblldb-$CLANG_VERSION-dbg \
      liblldb-$CLANG_VERSION-dev \
      lldb-$CLANG_VERSION \
      llvm-$CLANG_VERSION-dev \
      libclang-$CLANG_VERSION-dev \
      libclang-common-$CLANG_VERSION-dev \
      clang-$CLANG_VERSION \
      make \
      patch \
      perl \
      ppl-dev \
      python-software-properties \
      ruby \
      software-properties-common \
      tar \
      uuid-dev \
      wget \
      zlib1g-dev


# RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$GCC_VERSION 20 && \
    # update-alternatives --install /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-$GCC_VERSION 20 && \
    # update-alternatives --install /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-$GCC_VERSION 20 && \
    # update-alternatives --install /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-$GCC_VERSION 20 && \
    # update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-$GCC_VERSION 20 && \
    # update-alternatives --install /usr/bin/gcov-tool gcov-tool /usr/bin/gcov-tool-$GCC_VERSION 20 && \

    # update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-$CLANG_VERSION && \
    # update-alternatives --install /usr/bin/clang clang /usr/bin/clang-$CLANG_VERSION && \
    # update-alternatives --install /usr/bin/clang-apply-replacements clang-apply-replacements /usr/bin/clang-apply-replacements-$CLANG_VERSION && \
    # update-alternatives --install /usr/bin/clang-check clang-check /usr/bin/clang-check-$CLANG_VERSION && \
    # update-alternatives --install /usr/bin/clang-cl clang-cl /usr/bin/clang-cl-$CLANG_VERSION && \
    # update-alternatives --install /usr/bin/clang-query clang-query /usr/bin/clang-query-$CLANG_VERSION && \
    # update-alternatives --install /usr/bin/clang-rename clang-rename /usr/bin/clang-rename-$CLANG_VERSION && \
    # update-alternatives --install /usr/bin/clang-tblgen clang-tblgen /usr/bin/clang-tblgen-$CLANG_VERSION && \

    

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
