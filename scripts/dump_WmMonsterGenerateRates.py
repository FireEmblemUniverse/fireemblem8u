#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys

def dump_one_part(rom_data, off):
    print(f"    {rom_data[off + 0]:2}, {rom_data[off + 1]:2}, \
{rom_data[off + 2]:2}, {rom_data[off + 3]:2}, {rom_data[off + 4]:2}, \
{rom_data[off + 5]:2}, {rom_data[off + 6]:2}, {rom_data[off + 7]:2}, \
{rom_data[off + 8]:2},")

    return off + 9

def main(args):
    rom = "baserom.gba"

    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START [END]")

    try:
        end = eval(args[2])
    except IndexError:
        end = 0

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

if __name__ == '__main__':
    main(sys.argv)
