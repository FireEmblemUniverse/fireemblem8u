#!/bin/python3

import sys
import lzss_lib

def main(args):
    try:
        offset    = eval(args[1])
        out_fpath = args[2]

    except IndexError:
        sys.exit(f"Usage: {args[0]} <offset> <output>")

    with open(out_fpath, "wb") as f:
        f.write(lzss_lib.lz77_decomp_data(offset))

if __name__ == '__main__':
    main(sys.argv)
