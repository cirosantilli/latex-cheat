#!/usr/bin/env bash

set -eu

# Install TeX Live on Ubuntu 12.04.
#
# If you want to go **much** faster (20 minutes), first download TeX Live 2013 via torrent:
#   wget -O /tmp/texlive2013.torrent https://www.tug.org/texlive/files/texlive2013.iso.torrent 
# and put the ISO on the *current direcotory* with exact name: `texlive2013.iso`.
# If you don't do this, it will fallback to downloading from CTAN (4 hours).

# ISO install.
if [ ! -f texlive2013.iso ]; then
  wget texlive2013.iso http://mirrors.linsrv.net/tex-archive/systems/texlive/Images/texlive2013.iso
fi
sudo mkdir -p /media/texlive2013
sudo mount -t iso9660 -o ro,loop,noauto texlive2013.iso /media/texlive2013
echo i | sudo /media/texlive2013/install-tl
sudo umount /media/texlive2013
sudo rmdir /media/texlive2013
# If you are done with it for good:
#rm texlive2013.iso

# Downloader install. Less reliable since if one package fails all halts.
  # Slower because downloads multiple files.
  #cd /tmp
  #wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  #tar xzf install-tl-unx.tar.gz
  #cd install-tl-*
  ## This will take a while:
  #echo i | sudo ./install-tl
  #cd ..
  #sudo rm -rf install-tl-*

echo '
# Texlive
export PATH=$PATH:/usr/local/texlive/2013/bin/'"$(uname -i)"'-linux
export MANPATH=$MANPATH:/usr/local/texlive/2013/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2013/texmf-dist/doc/info
' >> ~/.profile

# Uninstall:
#sudo rm -rf /usr/local/texlive/2013 ~/.texlive2013
