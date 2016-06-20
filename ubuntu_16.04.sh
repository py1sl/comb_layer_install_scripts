#!/bin/bash
# this script builds comblayer on a clean ubuntu 16.04 lts version
# build comblayer and the latest ess general model
#
# run this script by the command ./ubuntu_16.04.sh
#
cd $HOME
#
sudo apt-get install -y build-essential clang-3.8 git libboost-regex-dev libgsl0-dev libboost-dev cmake doxygen
#
# need to make a link for clang
sudo ln -s \usr\bin\clang-3.8 \usr\bin\clang
#
mkdir comblayer
cd comblayer
git init
git clone https://github.com/py1sl/CombLayer
git remote add upstream https://github.com/SAnsell/CombLayer
mv CombLayer Master
cd Master
#
./CMake.pl -O
cmake ./
make
clang
make
#
make -j4 ess
#
doxygen 
