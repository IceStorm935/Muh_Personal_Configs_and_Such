# Remove cringe
sudo apt remove xterm synaptic exfalso parole xfburn quodlibet
sudo apt autoremove

# Install Software
SOFTWARE= cat packages.txt
sudo apt update && sudo apt upgrade -y
sudo apt install -y  $SOFTWARE

# qtile
pip install qtile

# multiload-ng
git clone https://github.com/udda/multiload-ng
./autogen.sh
./configure --prefix=/usr

# .configs
mkdir ~/Documents/My\ Configs/
git clone https://github.com/IceStorm935/Muh_Private_Configs.git -C ~/Documents/My\ Configs
mv ~/My\ Configs/* ~/.config/

# .bashrc
echo "
alias upd='sudo apt update && sudo apt upgrade'
alias autorm='sudo apt autoremove'
alias add='sudo apt install'
alias del='sudo apt remove'
alias neo='neofetch --ascii_distro debian
alias hollywood='cd ~/Downloads/ && ./eDEX-UI-Linux-x86_64.AppImage'
alias vpn='cat ~/Downloads/VPN.txt && sudo openvpn ~/Downloads/mx.protonvpn.net.udp.ovpn'
" > ~/.bashrc
source .bashrc

# Automount SSD
sudo blkid | grep sda > UUID.txt
echo "UUID.txt" > /etc/fstab
sudo mkdir /mnt/sda
sudo mount -a

# Virt-Manager
sudo rc-service libvirtd start
sudo rc-update add libvirtd
sudo usermod -aG libvirt patriot
