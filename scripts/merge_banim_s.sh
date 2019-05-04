#!/bin/bash

# merge oam_l, oam_r, script, modes source files by animation

for f_script in ../banim/*_script.s
do
    if test -f $f_script
    then
        f_base=${f_script%script.s}
        n_base=${f_base##*/}
        echo "@ vim:ft=armv4" > $f_base"motion.s"
        echo -e "\t.global "$n_base"modes" >> $f_base"motion.s"
        echo -e "\t.global "$n_base"script" >> $f_base"motion.s"
        echo -e "\t.global "$n_base"oam_r" >> $f_base"motion.s"
        echo -e "\t.global "$n_base"oam_l" >> $f_base"motion.s"
        echo -e "\t.include \"../include/banim_sheet.inc\"" >> $f_base"motion.s"
        cat $f_base"oam_l.s" | sed -e '1d; /\.global/d; s/\.section \.data/\.section \.data\.oam_l/g; 2i\    .include "../include/banim_code.inc"' >> $f_base"motion.s"
        cat $f_base"oam_r.s" | sed -e '1,3d; /\.global/d; s/\.section \.data/\.section \.data\.oam_r/g' >> $f_base"motion.s"
        cat $f_script | sed -e '1d; s/\.section \.data/\.section \.data\.script/g; /\.include/d; /\.global/d' >> $f_base"motion.s"
        echo -e "\t.section .data.modes" >> $f_base"motion.s"
        echo $n_base"modes:" >> $f_base"motion.s"
        for mode in attack_close attack_close_back attack_close_critical attack_close_critical_back attack_range attack_range_critical dodge_close dodge_range stand_close stand stand_range attack_miss
        do
            printf "\t.word %smode_%s - %sscript\n" $n_base $mode $n_base >> $f_base"motion.s"
        done
        for((i=0;i<12;i++));do
            echo -e "\t.word 0" >> $f_base"motion.s";
        done;
        echo "" >> $f_base"motion.s"
        rm $f_base"oam_l.s"
        rm $f_base"oam_r.s"
        rm $f_script
    fi
done
