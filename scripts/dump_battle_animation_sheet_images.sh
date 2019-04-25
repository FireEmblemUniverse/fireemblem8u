#!/bin/bash

# width: 256, height: 64, 4bpp, lz77 compressed, no palette, range:0xC02000~0xE45ED4
# by laqieer
# 2019/4/25

. lz77.sh

((start=0xC02000))
((end=0xE45ED4))

p=$start
i=0
echo -e "\t.section .data\n" > out/banim_sheets.s
echo -e "\t.global banim_table\nbanim_table:\n\t.incbin \"baserom.gba\", 0xC00008, 0x2000-8\n" >> out/banim_sheets.s
date > out/error.log
while(( $p<=$end ))
do
	head=`od -j $p -N4 -t x1 ../baserom.gba|head -1`
	head=${head:0-11:11}
	gap=0
	while [[ $head != '10 00 20 00' && $p -lt $end ]]
	do
		let "gap+=4"
		let "p+=4"
		head=`od -j $p -N4 -t x1 ../baserom.gba|head -1`
		head=${head:0-11:11}
	done
	if [ $gap -gt 0 ]
	then
		s=`expr $p - $gap`
		printf "\t.global gUnknown_%X\ngUnkonown_%X:\t@ 0x%X\n\t.incbin \"../baserom.gba\", 0x%X, 0x%X\n\n" $s $s $s $s $gap >> out/banim_sheets.s
	fi
	if [ $p -lt $end ]
	then
		echo "sheet $i at $p"
		len=`get_lz_len ../baserom.gba $p`
		temp=`dd bs=1 skip=$p count=$len if=../baserom.gba of=out/banim_sheet_$i.lz`
		temp=$temp`../tools/gbagfx/gbagfx out/banim_sheet_$i.lz out/banim_sheet_$i.4bpp`
		temp=$temp`../tools/gbagfx/gbagfx out/banim_sheet_$i.4bpp out/banim_sheet_$i.png -width 32`
		if [[ $temp =~ error ]]
		then
			echo $temp >> out/error.log
		else
			echo -e "\t.global banim_sheet_$i\nbanim_sheet_$i:\n\t.incbin \"../graphics/banim_sheet_$i.lz\"\n\t.align 2, 0\n" >> out/banim_sheets.s
		fi
		let "i++"
		let "p+=len"
	fi
done
