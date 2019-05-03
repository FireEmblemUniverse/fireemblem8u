#!/usr/bin/env python3

# compressor for linker
# compressor.py <filename> <comptype>

import os
import sys

filename = sys.argv[1]
comptype = sys.argv[2]

if comptype == 'lz':
    os.system('tools/gbagfx/gbagfx %s %s.lz' % (filename, filename))

