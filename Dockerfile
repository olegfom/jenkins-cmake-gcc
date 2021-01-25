FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN uname -a

# Pre-Req Repos
#RUN apt-get update \
# && apt-get install -y software-properties-common \
# && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
# Install pre-reqs
RUN apt-get update \
 && apt-get install -y \
  ca-certificates \
  build-essential make cmake
# Install Tool
RUN apt-get -y upgrade
RUN echo 'deb http://deb.debian.org/debian testing main' >> /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN gcc --version
RUN g++ --version
RUN make --version
RUN cmake --version

RUN apt-get install -y docker.io
RUN dpkg-query -L docker.io
RUN apt-get install -y systemd
RUN systemctl restart docker
RUN docker run helloworld
USER jenkins
