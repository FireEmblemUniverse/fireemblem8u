#!/usr/bin/python3
# -*- coding: UTF-8 -*-

from fe8db import JID_IDX
import sys

def dump_one_group(rom_data, off):
    print(f"CONST_DATA u8 Unk_{off + 0x08000000:08X}[] = " + "{")

    while True:
        jid_idx = JID_IDX(rom_data[off])
        off = off + 1

        print(f"    {jid_idx},")

        if jid_idx == "CLASS_NONE":
            break

    print("};\n")
    return off

def main(args):
    rom = "baserom.gba"

    start = eval(args[1])
    end = eval(args[2])

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_one_group(rom_data, off)

            if off_end <= off:
                break

if __name__ == '__main__':
    main(sys.argv)
