ARG VERSION

FROM archlinux:${VERSION:-latest}

RUN pacman -Syu --noconfirm xorg-server \
	wget alacritty which \
	i3-wm python-setuptools ttf-dejavu dmenu \
	git base-devel rofi i3status terminator

COPY etc/skel/ /etc/skel/

RUN groupadd -g 1001 yay
RUN useradd -ms /bin/bash -u 1001 -g 1001 yay
RUN usermod -a -G wheel yay
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER yay
WORKDIR /home/yay

RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay && makepkg -si --noconfirm --needed

RUN yay -Syyuu --noconfirm --needed --cleanafter --useask

RUN yay -S --noconfirm --needed --cleanafter --useask \
	jack2-dbus pulseaudio-jack pulseaudio-alsa \
  neovim neovim-symlinks \
	nfs-utils htop nss chromium xz mpg123 exa bat \
  thunar thunar-volman gvfs && \
	yay -Scc --noconfirm

CMD i3
