#!/bin/bash

# dump blank animation sheet

. lz77.sh

if [ $# -eq 0 ]
then
    echo $0 offset label
else
    offset=$((16#$1))
    len=`get_lz_len ../baserom.gba $offset`
    dd bs=1 count=$len skip=$offset if="../baserom.gba" of="out/$2.4bpp.lz"
    ../tools/gbagfx/gbagfx "out/$2.4bpp.lz" "out/$2.4bpp"
    ../tools/gbagfx/gbagfx "out/$2.4bpp" "out/$2.png" -width 32 -palette 'out/'${2%_sheet*}'_pal_player.gbapal'
    mv "out/$2.png" ../graphics/banim/
    printf "length: %x\n" $len
    printf "\t.global %s\n%s:\n\t.incbin \"graphics/banim/%s.4bpp.lz\"\n\t.align 2, 0\n" $2 $2 $2
fi

