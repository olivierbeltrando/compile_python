#! /usr/bin/env bash
source version.sh
python_version_short=$python_version_major.$python_version_minor
python_version=$python_version_short.$python_version_patch
rm -Rf Python-$python_version.tar.xz
wget https://www.python.org/ftp/python/$python_version/Python-$python_version.tar.xz
