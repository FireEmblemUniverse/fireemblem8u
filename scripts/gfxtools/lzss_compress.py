#!/bin/python3

import sys
import lzss_lib

def main(args):
    try:
        in_fpath  = args[1]
        out_fpath = args[2]

    except IndexError:
        sys.exit(f"Usage: {args[0]} <input> <output>")

    with open(in_fpath, 'rb') as f:
        bin_data = f.read()

    with open(out_fpath, "wb") as f:
        compressed_data = lzss_lib.lz77_compress(bin_data)
        f.write(compressed_data)

if __name__ == '__main__':
    main(sys.argv)
