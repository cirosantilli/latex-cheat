#!/usr/bin/env bash

cd /tmp
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xzf install-tl-unx.tar.gz
cd install-tl-*
# This will take a while
echo i | sudo ./install-tl
echo '
# Texlive
export PATH=$PATH:/usr/local/texlive/2013/bin/i386-linux
export MANPATH=$MANPATH:/usr/local/texlive/2013/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2013/texmf-dist/doc/info
' >> ~/.profile
cd ..
sudo rm -rf install-tl-*
