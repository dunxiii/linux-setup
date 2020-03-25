#!/usr/bin/env bash

# Chromium root directory
root="$HOME"/snap/chromium/current

# Create a temporary directory
tmpdir=$(mktemp -d)

# Download Chrome
echo "Downloading Chrome package..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -qO "$tmpdir"/chrome.deb

# Extract the archive
mkdir "$tmpdir"/chrome
echo "Extracting Chrome package..."
dpkg-deb -R "$tmpdir"/chrome.deb "$tmpdir"/chrome

# Copy the Widevine directory tree to the proper location
if [ ! -d "$root"/.local/lib ]; then
  mkdir -p "$root"/.local/lib
fi
if [ -d "$root"/.local/lib/WidevineCdm ]; then
  rm -R "$root"/.local/lib/WidevineCdm
fi
echo "Copying Widevine directory..."
cp -R "$tmpdir"/chrome/opt/google/chrome/WidevineCdm "$root"/.local/lib/

# Clean up
echo "Cleaning up..."
rm -R "$tmpdir"
echo "Please restart Chromium."

exit 0
