#!/usr/bin/env bash

# requirements:
# sudo apt-get install python-dev python3-dev
# have the Python-3.8.2.tar.xz containing sources in the same folder

# in case of install error for pycrypto, please check that the tmp is executable

source version.sh
python_version_short=$python_version_major.$python_version_minor
python_version_precise=$python_version_short.$python_version_patch

echo $python_version_short
echo $python_version_precise

# get rid of old pip cache that can conflict
rm -Rf $HOME/.cache/pip
rm -Rf $HOME/.pip

# install python in the current folder
prefix=$PWD/python$python_version_short
echo $prefix

# get rid of previous symlink (useful when you want to upgrade the patch version)
if [ -h "python$python_version_short" ]; then
    echo "deleting symlink"
    rm python$python_version_short
fi
# get rid of the extraction of previous Sources, to be sure to start from scratch
rm -Rf Python-$python_version_precise
# re-extract
tar xJf Python-$python_version_precise.tar.xz
# symlink to newly built with symlink containing major.minor
ln -s $PWD/Python-$python_version_precise python$python_version_short
# the build itself
gnuArch="$(dpkg-architecture -qDEB_BUILD_GNU_TYPE)" \
    && cd python$python_version_short \
    && ./configure \
        --enable-ipv6 \
        --enable-optimizations \
        --build="$gnuArch" \
        --enable-unicode=ucs4 \
        --prefix=$prefix \
    && make -j "$(nproc)" \
    && make install

echo "all done. be sure to add this to your path -> copy paste into your .bashrc/.zshrc"
echo "export PATH=\"$prefix/bin:\$PATH\""

