# Use this command to create an Ubuntu test container:
#
#   docker build -t ubuntu:dotfiles .

FROM ubuntu:latest
MAINTAINER Pedro Barbosa <pedbarbosa@users.noreply.github.com>

RUN apt-get update && apt-get install -y git sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN echo '%docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker

RUN git clone https://github.com/pedbarbosa/dotfiles ~/git/dotfiles/
RUN cd ~/git/dotfiles && ~/git/dotfiles/install -v

