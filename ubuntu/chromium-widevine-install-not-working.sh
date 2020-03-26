#!/bin/bash

# Get latest widevine version
# !!! this binary does not work for some reason !!!
LATEST=`curl https://dl.google.com/widevine-cdm/current.txt`
wget https://dl.google.com/widevine-cdm/$LATEST-linux-x64.zip

root_path="$HOME"/snap/chromium/current/.local/lib/WidevineCdm

if [ ! -d "${root_path}" ]; then
  mkdir -p "${root_path}"
fi

unzip $LATEST-linux-x64.zip -d "${root_path}"

so_path="${root_path}/_platform_specific/linux_x64"

if [ ! -d "${so_path}" ]; then
  mkdir -p "${so_path}"
fi

mv "${root_path}/libwidevinecdm.so" "${so_path}"

chmod 644 "${so_path}/libwidevinecdm.so"
