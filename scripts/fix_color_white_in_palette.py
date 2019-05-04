#!/usr/bin/env python3

# replace 0x7FFF to 0xFFFF in palette

import sys
import struct

def replace_7fff_to_ffff(fp):
    s = fp.read()
    colors = len(s) // 2
    palette = list(struct.unpack('<%dH' % colors, s))
    for i in range(colors):
        if palette[i] == 0x7FFF:
            palette[i] = 0xFFFF
    s = struct.pack('<%dH' % colors, *palette)
    fp.seek(0)
    fp.write(s)

def main(argv):
    with open(argv[1], 'rb+') as f_pal:
        replace_7fff_to_ffff(f_pal)

if __name__ == '__main__':
    main(sys.argv)

