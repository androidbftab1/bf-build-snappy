FROM	ubuntu:14.04.3
MAINTAINER	noralee 	https://hub.docker.com/u/noralee/

RUN apt-get update

RUN apt-get install -y openssh-server
RUN apt-get install -y build-essential
RUN apt-get install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
RUN apt-get install -y unzip
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y mercurial
RUN apt-get install -y vim
RUN apt-get install -y bc
RUN apt-get install -y u-boot-tools
RUN apt-get install -y device-tree-compiler

RUN apt-get install -y pkg-config
RUN apt-get install -y libusb-1.0-0-dev

RUN apt-get install -y python-software-properties software-properties-common

RUN add-apt-repository -y ppa:snappy-dev/tools
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y snappy-tools bzr

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME ["/media"]

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
