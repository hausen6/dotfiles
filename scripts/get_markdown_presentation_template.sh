#!/bin/bash
if [ $# -lt 1 ]; then
	name="markdown"
else
	name=$1
fi
wget https://github.com/hausen6/markup_presentation/archive/markdown.zip
unzip markdown.zip
mv markup_presentation-markdown $name
rm -rf markdown.zip
