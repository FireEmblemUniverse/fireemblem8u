#!/bin/bash

for f in asm/*.s
do
	echo "Processing - $f..."
    python3 scripts/add_asm_func_end.py $f
done
