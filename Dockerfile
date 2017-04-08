FROM ubuntu:16.04
LABEL maintainer "solosuper"

RUN apt update && apt-get install -y --no-install-recommends \
  firefox \
  libcanberra-gtk-module \
  libexif-dev \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libpango1.0-0 \
  libv4l-0 \
  lightdm \
  lxde \
  lxde-common \
  python \
  wget \
  xinit \
  xserver-xorg \
  xserver-xorg-video-fbdev \
  xterm \
  && apt-get clean