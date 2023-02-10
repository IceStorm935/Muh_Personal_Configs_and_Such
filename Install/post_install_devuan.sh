# Remove cringe
sudo apt remove xterm synaptic exfalso parole xfburn quodlibet slim
sudo apt autoremove

# Install Software
sudo dpkg --add-architecture i386
sudo apt update && sudo apt upgrade -y
Software=packages.txt
sudo apt install -y  $Software

# qtile
pip install qtile
pip install psutil
sudo touch /usr/share/xsessions/qtile.desktop
echo "
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=qtile start
Type=Application
Keywords=wm;tiling
" >> /usr/share/xsessions/qtile.desktop

# multiload-ng
git clone https://github.com/udda/multiload-ng /home/patriot/
cd /home/patriot/multiload-ng
./autogen.sh
./configure --prefix=/usr
make
sudo make install
cd

# .configs
mkdir /home/patriot/Documents/My\ Configs/
git clone https://github.com/IceStorm935/Muh_Private_Configs.git -C /home/patriot/Documents/My\ Configs
mv /home/patriot/Documents/My\ Configs/* /home/patriot/.config/

# .bashrc
echo "alias upd='sudo apt update && sudo apt upgrade'
alias autorm='sudo apt autoremove'
alias add='sudo apt install'
alias del='sudo apt remove'
alias neo='neofetch --ascii_distro debian'
alias hollywood='cd ~/Downloads/ && ./eDEX-UI-Linux-x86_64.AppImage'
alias vpn='cat ~/Downloads/VPN.txt && sudo openvpn ~/Downloads/mx.protonvpn.net.udp.ovpn'" >> .bashrc
source .bashrc

# Automount SSD Start
sudo blkid | grep sda > UUID.txt
sudo mkdir /mnt/sda

# Virt-Manager
sudo rc-service libvirtd start
sudo rc-update add libvirtd
sudo usermod -aG libvirt patriot

echo "Place the UUID in fstab, then mount with sudo mount -a"
