#!/usr/bin/env python3
import struct

bin_file_path = "baserom.gba"
start_offset = 0x0d8740
struct_count = 81

TACTICIAN_TEXT_CONF_FORMAT = "<12I 2H B 2x 4h B"
STRUCT_SIZE = 0x40

def read_string(f):
    array = bytearray(b'')

    while True:
        byte = f.read(1)[0]

        if byte == 0:
            break

        array.append(byte)

    return array

def parse_jis(addr):
    with open(bin_file_path, "rb") as f:
        f.seek(addr & 0x1FFFFFF)

        array = read_string(f)

        if len(array) == 0:
            return "\\0"
        elif array[0] == 0x20:
            return "\\n"
        else:
            return array.decode('cp932')

with open(bin_file_path, "rb") as f:
    f.seek(start_offset)

    print("const struct TacticianTextConf gTacticianTextConf[] = {")

    for i in range(struct_count):
        data = f.read(STRUCT_SIZE)
        if len(data) < STRUCT_SIZE:
            print("Error: Not enough data read from the file.")
            break

        print(f"    [{i}] = " + "{")
        print( "        .str = { ", end="")
        print(f"\"{parse_jis(int.from_bytes(data[0x00:0x04], 'little'))}\", ", end="")
        print(f"\"{parse_jis(int.from_bytes(data[0x04:0x08], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x08:0x0C], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x0C:0x10], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x10:0x14], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x14:0x18], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x18:0x1C], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x1C:0x20], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x20:0x24], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x24:0x28], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x28:0x2C], 'little'))}\",", end = "")
        print(f"\"{parse_jis(int.from_bytes(data[0x2C:0x30], 'little'))}\",", end = "")
        print( "},")
        print(f"        .x = 0x{int.from_bytes(data[0x30:0x32], 'little'):X},")
        print(f"        .y = 0x{int.from_bytes(data[0x32:0x34], 'little'):X},")

        if data[0x34] != 0:
            print(f"        .kind = {data[0x34]},")

        if data[0x35] != 0:
            print(f"        .pad = 0x{data[0x35]:02X},")

        print(f"        .adj_idx = {{ {int.from_bytes(data[0x36:0x38], 'little')}, {int.from_bytes(data[0x38:0x3A], 'little')}, {int.from_bytes(data[0x3A:0x3C], 'little')}, {int.from_bytes(data[0x3C:0x3E], 'little')} }},")

        if data[0x3E] != 0:
            print(f"        .action = {data[0x3E]}")

        print( "    },")
    print("};")
