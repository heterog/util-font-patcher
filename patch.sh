#!/bin/bash

target="$HOME/.local/share/fonts/ubuntu-mono"
rm -rf "$target"
mkdir -p "$target"

for ttf in $(fc-list | grep ubuntu | awk -F: '{print $1}'); do
	echo "patching $ttf..."
	python3 src/main.py --factor=1.25 --input="$ttf" --outputDir="$target"
done

fc-cache -fv
