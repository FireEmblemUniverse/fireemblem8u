#!/bin/python3

import sys, re
import numpy as np
from PIL import Image

'''
方案1:
常见于 banim 相关的图片
1. 整张图按行从左向右扫描, 将获得的独特的 tile 入栈, 从而获得 tile array
2. 上述获得的第一个 tile 丢到末尾作为最后一个 tile
3. tile array 第 0 个 tile 置空
'''
def process_tiles_method1(tiles, ntile_x, ntile_y):
    unique_tiles = []
    tsa_data = []
    tile_dict = {}

    for tile_y in range(0, ntile_y):
        for tile_x in range(0, ntile_x):
            tile = tiles[tile_y][tile_x]

            tile_4bpp = convert_to_4bpp(tile)
            tile_tuple = tuple(tile_4bpp)

            tile_2d = tile.reshape((8, 8))
            tile_hf = np.flip(tile_2d, axis=1).flatten()
            tile_vf = np.flip(tile_2d, axis=0).flatten()
            tile_se = np.flip(tile_2d).flatten()

            tile_hf_4bpp = convert_to_4bpp(tile_hf)
            tile_hf_tuple = tuple(tile_hf_4bpp)

            tile_vf_4bpp = convert_to_4bpp(tile_vf)
            tile_vf_tuple = tuple(tile_vf_4bpp)

            tile_se_4bpp = convert_to_4bpp(tile_se)
            tile_se_tuple = tuple(tile_se_4bpp)

            if tile_tuple in tile_dict:
                tsa_data.append(tile_dict[tile_tuple])
            elif tile_hf_tuple in tile_dict:
                tsa_data.append(tile_dict[tile_hf_tuple] | (1 << 10))
            elif tile_vf_tuple in tile_dict:
                tsa_data.append(tile_dict[tile_vf_tuple] | (2 << 10))
            elif tile_se_tuple in tile_dict:
                tsa_data.append(tile_dict[tile_se_tuple] | (3 << 10))
            else:
                # fine, we did not find it
                unique_tiles.append(tile_4bpp)
                tile_index = len(unique_tiles) - 1
                tile_dict[tile_tuple] = tile_index
                tsa_data.append(tile_index)

    # put the first tile to the tale
    last_idx = len(unique_tiles)
    print(last_idx)
    for i, tsa in enumerate(tsa_data):
        if tsa == 0:
            tsa_data[i] = last_idx

    unique_tiles.append(unique_tiles[0])
    unique_tiles[0] = [0] * 32

    return unique_tiles, tsa_data

'''
方案2: (todo)
1. 以 8 个 tile 为一行，将图片分割为多个列
2. 按照方案1的方式扫描所有列
'''

def extract_tiles(image, ntile_x, ntile_y):
    tiles = [[None for _ in range(ntile_x)] for _ in range(ntile_y)]

    for tile_y in range(0, ntile_y):
        for tile_x in range(0, ntile_x):
            x = tile_x * 8
            y = tile_y * 8

            tile = image.crop((x, y, x + 8, y + 8))
            tile_data = np.array(tile).flatten()

            tiles[tile_y][tile_x] = tile_data

    return tiles

def convert_to_4bpp(tile):
    result = []
    for i in range(0, len(tile), 2):
        byte = (tile[i] & 0xF) | ((tile[i + 1] & 0xF) << 4)
        result.append(byte)
    return result

def extract_suffix_from_filename(file_name):
    match = re.search(r'\.(fetsa(\d+)\.bin)$', file_name)
    if match:
        return match.group(2)
    return None

def main(args):
    try:
        png_file = args[1]
        out_img  = args[2]
        out_tsa  = args[3]
    except IndexError:
        sys.exit(f"Usage: {args[0]} [*.png] [*.feimg.bin] [*.fetsa<x>.bin]")

    method = extract_suffix_from_filename(out_tsa)
    if method is None:
        method = 0 # default

    image = Image.open(png_file)
    if image.mode != 'P':
        raise ValueError("IMAGE ERRIR (P mode)")

    width, height = image.size

    ntile_x = width  // 8
    ntile_y = height // 8

    tiles = extract_tiles(image, ntile_x, ntile_y)

    if method == 1:
        unique_tiles, tsa_data = process_tiles_method1(tiles, ntile_x, ntile_y)
    else:
        # todo
        unique_tiles, tsa_data = process_tiles_method1(tiles, ntile_x, ntile_y)

    with open(out_img, 'wb') as f:
        cnt = 0
        for tile in unique_tiles:
            cnt += 1
            f.write(bytearray(tile))

        if cnt > 0x100:
            raise ValueError("Compressed image overflowed!")

        for i in range(cnt, 0x100):
             f.write(b'\x00' * 32)

    with open(out_tsa, 'wb') as f:
        for entry in tsa_data:
            f.write(entry.to_bytes(2, byteorder='little'))

if __name__ == '__main__':
    main(sys.argv)
