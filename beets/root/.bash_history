blkid
exit
ifconfig
ping google.com
netstat -taunlp
vim /etc/mkinitcpio.conf 
pacman -S neovim
nvim /etc/mkinitcpio.conf 
mkinitcpio -p
mkinitcpio -P
pacman -S mdadm
nvim /etc/mkinitcpio.conf 
mkinitcpio -P
reboot
btrfs filesystem defragment -r /storage/
btrfs filesystem defragment -r -czstd /storage
exit
visudo -f /etc/sudoers.d/10-unix_admin 
export EDITOR=nvim
visudo -f /etc/sudoers.d/10-unix_admin 
cat /etc/group
exit
ll
visudo
export EDITOR=nvim
visudo
exit
exit
journalctl -r
reboot
export EDITOR=nvim
visudo -f /etc/sudoers.d/10-unix_admin 
rm -rf /etc/sudoers.d/10-unix_admin 
visudo
exit
iptables -nL
htop
exit
