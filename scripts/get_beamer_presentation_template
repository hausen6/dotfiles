#!/bin/bash
if [ $# -lt 1 ]; then
	name="beamer"
else
	name=$1
fi
wget https://github.com/hausen6/markup_presentation/archive/beamer.zip
unzip beamer.zip
mv markup_presentation-beamer $name
rm -rf beamer.zip
