FROM python:3.6.5-slim-jessie

RUN apt-get update -qq && apt-get install -qqy \
        apt-transport-https \
        ca-certificates \
        curl \
        lxc \
        iptables \
        gcc && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://get.docker.com/ | sh
ADD ./dockerwrap /usr/local/bin/dockerwrap

VOLUME /var/lib/docker
ENTRYPOINT ["dockerwrap"]
CMD ["python3"]