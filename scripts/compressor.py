#!/usr/bin/env python3

# compressor for linker
# compressor.py <filename> <comptype>

import os
import sys
import struct

filename = sys.argv[1]
comptype = sys.argv[2]

if comptype == 'lz':
    os.system('tools/gbagfx/gbagfx %s %s.lz' % (filename, filename))
elif comptype == 'fk':
    size = os.path.getsize(filename) + 4
    with open(filename, 'rb') as f:
        data = f.read()
    with open(filename + '.fk', 'wb') as f:
        f.write(struct.pack('<I', size << 8))
        f.write(data)

