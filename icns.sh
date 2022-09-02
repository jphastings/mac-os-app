#!/bin/bash
INPUT=$1
echo "Turning ${INPUT} into icon.icns"

mkdir icon.iconset
sizes=( 16 32 64 128 256 512 1024 )
for SIZE in "${sizes[@]}"; do
  file=icon.iconset/icon_${SIZE}x${SIZE}.png
  sips -z $SIZE $SIZE "$INPUT" --out ${file}

  if [[ $SIZE -ne 8 ]]; then
    half=icon.iconset/icon_$((SIZE / 2))x$((SIZE / 2))@2.png
    cp ${file} ${half}
  fi
done

iconutil -c icns -o icon.icns icon.iconset
rm -rf icon.iconset
