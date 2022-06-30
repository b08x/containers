ARG VERSION

FROM archlinux:${VERSION:-latest}
# LABEL MAINTAINER="DCsunset"

# copy directory contents to /scripts
RUN pacman -Syu --noconfirm xorg-server \
	wget alacritty which \
	i3-wm python-setuptools ttf-dejavu dmenu \
	git base-devel rofi i3status terminator

RUN useradd -ms /bin/bash yay
RUN usermod -a -G wheel yay
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER yay
WORKDIR /home/yay

RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay && makepkg -si --noconfirm --needed

RUN yay -S --noconfirm --needed --cleanafter --useask \
	jack2-dbus pulseaudio-jack pulseaudio-alsa \
	nfs-utils htop nss chromium && \
	yay -Scc --noconfirm

RUN export TMPDIR=/var/tmp

COPY etc/skel/.config/ /etc/skel/.config/

CMD i3
