FROM debian:12.2 AS build
RUN apt update
RUN apt install -y build-essential rsync git automake clang libssl-dev
RUN git clone --depth 1 --branch 1.0.5-release https://github.com/ObjFW/ObjFW.git
RUN cd ObjFW && chmod +x ./autogen.sh && ./autogen.sh && ./configure && make && make install
ENV PATH="/usr/local/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/lib"
