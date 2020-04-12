#!/bin/bash

# calculate function matching status

funcTotal=8528
funcToDecomp=`grep -r FUNC_START asm | wc -l`
funcDecomped=`expr $funcTotal - $funcToDecomp`
funcDecompRate=`echo "scale=3; 100*$funcDecomped/$funcTotal" | bc`
funcNonMatching=`grep -r NONMATCHING src | grep "#if"  | wc -l`

echo "$funcTotal functions in total, $funcDecomped functions ($funcDecompRate%) have been decompiled."
echo "$funcNonMatching functions are marked as unmatched."
