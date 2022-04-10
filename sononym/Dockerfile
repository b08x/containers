FROM x11docker/lxde
RUN apt-get -y update -qq && apt-get -y --no-install-recommends install libnss3 libxshmfence1 libdrm2 libgbm1 pulseaudio pavucontrol polyphone ca-certificates libreadline-dev dialog qutebrowser wget curl sudo bzip2

WORKDIR /tmp
RUN wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
RUN dpkg -i ./kxstudio-repos_10.0.3_all.deb

RUN apt-get -y update -qq \
    && apt-get install -qq -y --no-install-recommends \
        jackd2 catia fmit gxtuner ffmpeg \
        fontconfig fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-symbola fonts-noto fonts-freefont-ttf \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get -y update && apt-get upgrade -y
