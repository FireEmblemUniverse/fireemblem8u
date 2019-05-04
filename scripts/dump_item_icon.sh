#!/bin/bash

# dump item icons
# image: 5926F4 ~ 5996F4, 4bpp, 16x16, uncompressed, 224 icons
# palette: 5996F4, 16 colors

dd bs=4 skip=1467837 count=8 if=../baserom.gba of=out/item_icon_palette.gbapal

echo -e "\t.section .data" > out/data_item_icon.s

for((i=0;i<224;i++))
do
    ((p=1460669+32*i))
    dd bs=4 skip=$p count=32 if=../baserom.gba of=out/item_icon_$i.4bpp
    ../tools/gbagfx/gbagfx out/item_icon_$i.4bpp out/item_icon_$i.png -width 2 -palette out/item_icon_palette.gbapal
    printf "\t.global item_icon_%d\nitem_icon_%d:\n\t.incbin \"graphics/item_icon/item_icon_%d.4bpp\"\n" $i $i $i >> out/data_item_icon.s
done

echo -e "\t.global item_icon_palette\nitem_icon_palette:\n\t.incbin \"graphics/item_icon/item_icon_palette.agbpal\"" >> out/data_item_icon.s
