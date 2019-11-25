#!/bin/bash

# mkv2mp4
# Converts one or multiple MKV files to MP4
# Preserves original video and audio sources

# Convert single MKV (single argument)
convert_one () { 
  ffmpeg -i "$1" -codec copy "${1%.mkv}.mp4"
}

# Convert all MKVs in current directory
convert_all () { 
  for i in *.mkv; do                   
    convert_one "$i"
  done
}

main () {
  if [ $# -ne 0 ]; then
    convert_one $1
  else
    convert_all
  fi
}

exit 0