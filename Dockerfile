FROM ctfd/ctfd

# apply patches
WORKDIR /opt/CTFd
COPY ./patch.txt /opt/CTFd/patch.txt
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        patch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN patch -s -p1 < patch.txt

COPY ./favicon.ico /opt/CTFd/CTFd/themes/core/static/img/favicon.ico
