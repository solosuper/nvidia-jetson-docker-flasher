#!/usr/bin/env bash
if ! pgrep -i "xquartz" > /dev/null; then
  open -a XQuartz&
fi
ip=$(ifconfig en1 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip
#xhost +local:docker
docker run --rm -it \
  --privileged \
  -e DISPLAY=$ip:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  jetpacker

#-v/tmp/:/data \
#-v /dev:/dev  \
#-v /lib/modules:/lib/modules \