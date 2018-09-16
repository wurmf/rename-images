#!/bin/sh

exiv2 -K Exif.Photo.DateTimeOriginal $1 | grep -o '[0-9]\{4\}:[0-9]\{2\}:[0-9]\{2\}' | sed s/:/./g
