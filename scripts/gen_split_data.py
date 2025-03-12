#!/usr/bin/python3
# -*- coding: UTF-8 -*-

# split data

import os, sys, subprocess

def generate_unsymboled_const_data():
    list = {}

    _identifier = "0x"
    start_offse = 0

    for line in sys.stdin.readlines():
        if _identifier in line:
            ptr = eval(line[start_offse:start_offse+10])

            list[ptr] = f"gUnk_{ptr:08X}"

    return sorted(list.values())

def write_data(fs, fh, symbol, start, end):
    # fh.write(f'// ??? {symbol}\n')
    fh.write(f'extern u8 {symbol}[];\n')

    fs.write(f'\n\t.global {symbol}\n')
    fs.write(f'{symbol}:\t@ 0x{symbol[5:5+8]}\n')
    fs.write(f'\t.incbin "baserom.gba", 0x{start:06X}, 0x{end:06X} - 0x{start:06X}\n')

def main(args):
    try:
        out_s = args[1]
        out_h = args[2]
    except IndexError:
        sys.exit(f"Usage: {args[0]} OUT_FILE_S OUT_FILE_H")

    symbols = generate_unsymboled_const_data()

    with open(out_s, 'w') as fs, open(out_h, 'w') as fh:
        for i in range(len(symbols)):
            symbol = symbols[i]
            off1 = eval(f'0x{symbol[7:7+6]}')

            if i == (len(symbols) - 1):
                off2 = 0
            else:
                symbol2 = symbols[i + 1]
                off2 = eval(f'0x{symbol2[7:7+6]}')

            print(symbol)

            write_data(fs, fh, symbol, off1, off2)

if __name__ == '__main__':
    main(sys.argv)
