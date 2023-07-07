FROM i3arch:latest

#TODO: fetch latest from download url

ENV TMPDIR=/var/tmp \
    PATH="$PATH:/opt/sononym"

RUN groupadd -g 1000 sononym
RUN useradd -ms /bin/bash -u 1000 -g 1000 sononym

COPY opt/ /opt/

USER sononym
WORKDIR /home/sononym

CMD ["/opt/sononym/sononym"]
