FROM node:9.11.2

RUN apt-get update \
    && apt-get -y install apt-transport-https \
    && apt-get -y install software-properties-common

RUN apt-get -y install wine

RUN dpkg --add-architecture i386 \
    && wget -nc https://dl.winehq.org/wine-builds/Release.key \
    && apt-key add Release.key \
    && apt-add-repository https://dl.winehq.org/wine-builds/debian/

RUN apt-get update

RUN apt-get -y install --install-recommends --allow-unauthenticated winehq-stable
