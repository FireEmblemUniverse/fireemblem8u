#!/bin/bash -ex

map_file=fireemblem8.map
if [ ! -f $map_file ]; then
  echo "$map_file does not exist!"
  exit 1
fi

perl scripts/calcrom.pl $map_file
sh scripts/calcfunc.sh
