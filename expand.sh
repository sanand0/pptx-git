#!/usr/bin/sh

# Unzip and clean up the PPTX for easy comparison

# Unzip the files
/d/Apps/7zip/App/7-Zip/7z x -y $1

# Indent them using tidy
find . -name '*.xml' -print0 | xargs -0 tidy -q -raw -xml --wrap 9999 -indent -modify

# Change file permissions to normal ones in cygwin
find . -type d -print0 | xargs -0 chmod 755
find . -type f -print0 | xargs -0 chmod 644
