FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y ttyd bash && \
    apt clean

EXPOSE 7681

CMD ["ttyd", "-W", "bash"]
