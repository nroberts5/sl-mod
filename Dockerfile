# Get the base Ubuntu image from Docker Hub
FROM sl:7
LABEL Name=sl-mod Version=0.0.1

# Update apps on the base image
RUN yum -y update

# Install the g++ compiler and cmake
RUN yum install tcsh -y
RUN yum install gcc -y
RUN yum install gcc-c++ -y
RUN yum install make -y
RUN ln -sf /lib64/libz.so.1 /lib64/libz.so
RUN yum install -y openssl-devel
RUN yum install cmake -y && yum remove cmake -y

# Install Latest Version of cmake
COPY ./cmake /usr/src/cmake
RUN tar -xzf /usr/src/cmake/cmake-3.17.0-rc1.tar.gz --directory /usr/src/cmake && rm -f /usr/src/cmake/cmake-3.17.0-rc1.tar.gz
RUN cd /usr/src/cmake/cmake-3.17.0-rc1 && ./bootstrap && make && make install