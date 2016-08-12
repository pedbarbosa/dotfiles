FROM ubuntu:latest
MAINTAINER Pedro Barbosa <pedbarbosa@users.noreply.github.com>

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/pedbarbosa/dotfiles ~/git/dotfiles/
RUN cd ~/git/dotfiles && ~/git/dotfiles/install -v

