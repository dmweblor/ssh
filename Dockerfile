FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    lxde-core \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    firefox \
    wget \
    && apt clean

RUN mkdir -p /root/.vnc && \
    x11vnc -storepasswd 123456 /root/.vnc/passwd

EXPOSE 6080

CMD bash -c '\
Xvfb :0 -screen 0 1280x720x24 & \
export DISPLAY=:0 && \
startlxde & \
x11vnc -display :0 -forever -rfbauth /root/.vnc/passwd -rfbport 5900 & \
websockify --web=/usr/share/novnc 6080 localhost:5900'
