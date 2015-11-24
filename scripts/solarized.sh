#!/usr/bin/env bash

# download
color_dir="solarized"
git clone https://github.com/mavnn/mintty-colors-solarized $color_dir

cat $color_dir/.minttyrc.dark >> ~/.minttyrc
rm -rf $color_dir
