ARG VERSION

FROM archlinux:${VERSION:-latest}
# LABEL MAINTAINER="DCsunset"

# copy directory contents to /scripts
RUN pacman -Syu --noconfirm xorg-server \
	wget alacritty which \
	i3-wm python-setuptools ttf-dejavu dmenu \
	git base-devel rofi terminator

RUN useradd -ms /bin/bash yay
RUN usermod -a -G wheel yay
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER yay
WORKDIR /home/yay

RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay && makepkg -si --noconfirm --needed

COPY etc/skel/.config/ /etc/skel/.config/

CMD i3
