#!/bin/bash

# dependencies for Tesserect

sudo apt-get install -y libpng-dev libjpeg-dev libtiff-dev zlib1g-dev
sudo apt-get install -y gcc g++
sudo apt-get install -y autoconf automake libtool checkinstall
sudo apt-get install -y pkg-config


# Leptonica is needed for Tesserect to run
# When the script was written 1.80.0 was the latest version
cd ~
wget http://www.leptonica.org/source/leptonica-1.80.0.tar.gz
tar -zxvf leptonica-1.80.0.tar.gz
cd leptonica-1.80.0/
./configure
make
sudo checkinstall
sudo ldconfig

#install Tesserect
cd ~ 
git clone https://github.com/UB-Mannheim/tesseract.git
cd tesseract
./autogen.sh
./configure
make
sudo make install 
sudo ldconfig

#download and store the english language
# cd ~
# git clone https://github.com/tesseract-ocr/tessdata.git
# sudo rm -rf  /usr/local/share/tessdata/*
# sudo mv ~/tessdata/* /usr/local/share/tessdata/
# rm -rf ~/tessdata