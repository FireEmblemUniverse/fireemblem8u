#!/bin/python3

import sys, os
import textdeparser, huffman

ROM = "baserom.gba"
TEXT_TABLE = 0x15D48C
TEXT_COUNT = 0xD6E

ROOT_NODE = 2902
HUFFMAN_TREE = 0x15A72C

log_settings = {
    'DEBUG': False,
    'INFO': False,
    'WARNING': True,
    'ERROR': True,
    'CRITICAL': True
}

def logprint(level, *args, **kwargs):
    if log_settings.get(level, False):
        print(f"[{level}]\t", *args, **kwargs)

def get_pr_offset(rom_data, addr):
    return int.from_bytes(rom_data[addr + 0:addr + 4], 'little') & 0xFFFFFF

def is_leaf(node_data):
    return (node_data & 0xFFFF0000) == 0xFFFF0000

def build_huffman_table(off=HUFFMAN_TREE, rom_fpath=ROM):
    huffman_table = []

    with open(rom_fpath, 'rb') as f:
        rom_data = f.read()

    for i in range(ROOT_NODE + 1):
        node_data = int.from_bytes(rom_data[off + 0:off + 4], 'little')

        logprint('DEBUG', f"node:0x{i:03X}=0x{node_data:08X} ")
        if is_leaf(node_data):
            logprint('DEBUG', f"leaf:0x{(node_data & 0xFFFF):04X}")
        else:
            logprint('DEBUG', f"left:0x{(node_data & 0xFFFF):04X}, right:0x{((node_data >> 16) & 0xFFFF):04X}")

        huffman_table.append(node_data)
        off = off + 4

    return huffman_table

def decode_data(rom_data, huffman_table, off):
    decoded_data = []
    bit_pos = -1
    cur_node = ROOT_NODE

    while True:
        if bit_pos < 0:
            current_byte = rom_data[off]
            off = off + 1
            bit_pos = 7

        bit = current_byte & 1
        current_byte = current_byte >> 1
        bit_pos = bit_pos - 1

        logprint('DEBUG', bit)

        if bit == 0:
            cur_node = huffman_table[cur_node] & 0xFFFF # left
        else:
            cur_node = (huffman_table[cur_node] >> 16) & 0xFFFF

        # check for leaf
        if is_leaf(huffman_table[cur_node]):
            data = huffman_table[cur_node] & 0xFFFF

            logprint('INFO', f"get leaf: 0x{cur_node:04X}=0x{data:X}")

            decoded_data.append(data)
            if data == 0:
                break

            cur_node = ROOT_NODE

    return decoded_data

def decode_single_string(msg_idx, rom_data, huffman_table):
    pr_encodered_string = get_pr_offset(rom_data, TEXT_TABLE + 4 * msg_idx)
    decoded_data = decode_data(rom_data, huffman_table, pr_encodered_string)
    # parsed_string = textdeparser.parse_string_shiftjis(decoded_data)
    parsed_string = textdeparser.parse_string_utf8(decoded_data)
    return parsed_string

def decode_test(msg_idx):
    with open(ROM, 'rb') as f:
        rom_data = f.read()

    huffman_table = build_huffman_table()
    parsed_string = decode_single_string(msg_idx, rom_data, huffman_table)
    print(parsed_string)

def decode_all_data():
    all_data = []

    with open(ROM, 'rb') as f:
        rom_data = f.read()

    huffman_table = build_huffman_table()
    for msg_idx in range(0xD4C):
        pr_encodered_string = get_pr_offset(rom_data, TEXT_TABLE + 4 * msg_idx)
        decoded_data = decode_data(rom_data, huffman_table, pr_encodered_string)
        all_data.extend(decoded_data)

    return all_data

def rebuild_huffman_tree(huffman_table, node=ROOT_NODE):

    if is_leaf(huffman_table[node]):
        return huffman.HuffNode(data=(huffman_table[node] & 0xFFFF), freq=0)

    left_node  = huffman_table[node] & 0xFFFF
    right_node = (huffman_table[node] >> 16) & 0xFFFF

    huff_node_left  = rebuild_huffman_tree(huffman_table, left_node)
    huff_node_right = rebuild_huffman_tree(huffman_table, right_node)
    return huffman.HuffNode(left=huff_node_left, right=huff_node_right)

def main():
    with open(ROM, 'rb') as f:
        rom_data = f.read()

    huffman_table = build_huffman_table()

    for msg_idx in range(0xD4C):
        parsed_string = decode_single_string(msg_idx, rom_data, huffman_table)

        if msg_idx == 0:
            print("#0x0")
        else:
            print(f"## MSG_{msg_idx:03X}")

        print(parsed_string)
        print("")

def debug_dump_decoded_data():
    with open(ROM, 'rb') as f:
        rom_data = f.read()

    huffman_table = build_huffman_table()

    for msg_idx in range(0xD4C):
        pr_encodered_string = get_pr_offset(rom_data, TEXT_TABLE + 4 * msg_idx)
        decoded_data = decode_data(rom_data, huffman_table, pr_encodered_string)

        print(f"MSG_{msg_idx:04X}:", end=" ")

        for data in decoded_data:
            print(f"0x{data:04X}", end=" ")

        print("")

if __name__ == '__main__':
	main()
    # debug_dump_decoded_data()
