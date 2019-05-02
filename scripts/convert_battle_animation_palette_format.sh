#!/bin/bash

cd out
rm *_pal.gbapal.lz
for file in `ls | grep _pal.gbapal`
do
    ../../tools/gbagfx/gbagfx $file ${file%_pal.gbapal}'.pal'
done
cd -
