#!/usr/bin/python3

# get the length of lz77 compressed data
# python3 get_lz77_compressed_data_length.py baserom.gba <offset>
# from pfero in #pret

from struct import unpack
from sys import argv

def align(num, align):
    if num % align == 0:
        return num
    return num + (align - (num % align))

def lz_getsize(file):
    file_begin = file.tell()

    file.read(1) # useless
    destsize = unpack("<H", file.read(2))[0]
    destsize |= unpack("<B", file.read(1))[0] << 16

    written = 0

    while True:
        flags = unpack("<B", file.read(1))[0]
        for x in range(8):
            if flags & 0x80:
                tmp, tmp2 = unpack("<BB", file.read(2))
                blocksize = (tmp >> 4) + 3
                blockdistance = (((tmp & 0xf) << 8) | tmp2) + 1

                written += blocksize
            else:
                file.read(1)
                written += 1

            if written >= destsize:
                return align(file.tell() - file_begin, 4)

            flags = (flags << 1) & 0xff

file = open(argv[1], "rb")
file.seek(int(argv[2], 0))
print(lz_getsize(file))
