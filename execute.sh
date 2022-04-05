#!/bin/bash
docker build -t dockerexe . --build-arg TOKEN=$(xauth list | head -n 1 | cut -d " " -f 5) --build-arg DISPLAY=$DISPLAY
# docker build .
xhost +
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix dockerexe
