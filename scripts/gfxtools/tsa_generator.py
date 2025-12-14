#!/bin/python3

import argparse, sys, re, os
import numpy as np
from PIL import Image
from tsa2 import main as tsa2_main

'''
方案1:
常见于 banim 相关的图片
1. 第 0 个 tile 置 0
2. 整张图按行从左向右扫描, 将获得的独特的 tile 入栈, 从而获得 tile array
3. 上述获得的第一个 tile 丢到末尾作为最后一个 tile
'''
def process_tiles_method1(tiles, ntile_x, ntile_y):
    unique_tiles = []
    tsa_data = []
    tile_dict = {}

    unique_tiles.append([0] * 32)

    is_first = True

    for tile_y in range(0, ntile_y):
        for tile_x in range(0, ntile_x):
            tile = tiles[tile_y][tile_x]

            tile_4bpp = convert_to_4bpp(tile)

            # skip tile[0]
            if tile_4bpp == [0] * 32:
                tsa_data.append(0)
                continue

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
                if is_first:
                    is_first = False
                    first_tile_4bpp = tile_4bpp
                    tile_index = -1
                else:
                    unique_tiles.append(tile_4bpp)
                    tile_index = len(unique_tiles) - 1

                tile_dict[tile_tuple] = tile_index
                tsa_data.append(tile_index)

    # put the first tile to the tale
    last_idx = len(unique_tiles)
    for i, tsa in enumerate(tsa_data):
        if tsa == -1:
            tsa_data[i] = last_idx

    unique_tiles.append(first_tile_4bpp)

    return unique_tiles, tsa_data
'''
方案2: (todo)
1. 以 8 个 tile 为一行，将图片分割为多个列
2. 按照方案1的方式扫描所有列
'''

def extract_tiles(image, ntile_x, ntile_y):
    tiles = np.empty((ntile_y, ntile_x), dtype=object)

    for tile_y in range(0, ntile_y):
        for tile_x in range(0, ntile_x):
            x = tile_x * 8
            y = tile_y * 8

            tile = image.crop((x, y, x + 8, y + 8))
            tile_data = np.asarray(tile).flatten()

            tiles[tile_y,tile_x] = tile_data

    return tiles

def convert_to_4bpp(tile):
    result = []
    for i in range(0, len(tile), 2):
        byte = (tile[i] & 0xF) | ((tile[i + 1] & 0xF) << 4)
        result.append(byte)
    return result

def extract_suffix_from_filename(file_name):
    match = re.search(r'\.(feimg(\d+)\.bin)$', file_name)
    if match:
        return int(match.group(2))
    return None

def main():
    usage = "Usage: [*.png] [*.feimg<x>.bin] [*.fetsa.bin]"
    parser = argparse.ArgumentParser(usage=usage)
    parser.add_argument("png_file", help="png file to convert")
    parser.add_argument("out_img", help="out *.feimg<x>.bin file", action='store')
    parser.add_argument("out_tsa", help="out *.fetsa<x>.bin file", action='store')
    parser.add_argument("--padding", help="Add padding to end or start (with minus numbers) of image", default=0, type=int, action='store')
    parser.add_argument("--num_tiles", help="Set final image to have <x> number of tiles", default=0, type=int, action='store')
    parser.add_argument("--starting_index", help="Change starting index",default=0, type=int, action='store')
    parser.add_argument("--blank_tile_index", help="Sets any tile id 0 to tile <x>",default=0, type=int, action='store')
    parser.add_argument("--pop_last_tile", help="Remove the end tile.", action='store_true')
    parser.add_argument("--flip_y_indexes", help="Flips the specified tile(s) y axis",default=[], type=lambda x :list(map(int, x.split(','))), action='store')
    parser.add_argument("--max_empty_index", help="Set empty tile to tile id 1023", action='store_true')
    parser.add_argument("--no_chunked", help="Don't chunk each row", action='store_true')
    try:
        args = parser.parse_args()
    except IndexError:
        sys.exit(parser.usage)

    png_file = args.png_file
    out_img  = args.out_img
    out_tsa  = args.out_tsa

    method = extract_suffix_from_filename(out_img)
    if method is None:
        method = 0 # default
    image = Image.open(png_file)
    if image.mode != 'P':
        raise ValueError("IMAGE ERROR (P mode)")

    width, height = image.size

    ntile_x = width  // 8
    ntile_y = height // 8

    tiles = extract_tiles(image, ntile_x, ntile_y)

    if method == 1:
        unique_tiles, tsa_data = process_tiles_method1(tiles, ntile_x, ntile_y)
    elif method in [2, 3, 4]:
        tsa_args = args.__dict__
        #battle backgrounds
        if method == 3:
            tsa_args["max_empty_index"] = True
            tsa_args["no_chunked"] = True
            tsa_args["num_tiles"] = 416
        if method == 4:
            tsa_args["no_chunked"] = True
        # TODO
        # 1. Allow arbitrary index sequence order. For example bg_Volcano which goes 0,1,2,3,4,6,8,7,15 etc
        tsa_data, unique_tiles = tsa2_main(tsa_args, np.array(tiles).flatten(),ntile_x, ntile_y )
        for i in range(len(unique_tiles)):
            unique_tiles[i] = convert_to_4bpp(unique_tiles[i].original.flatten())
    else:
        # todo
        unique_tiles, tsa_data = process_tiles_method1(tiles, ntile_x, ntile_y)

    with open(out_img, 'wb') as f:
        cnt = 0
        for tile in unique_tiles:
            cnt += 1
            f.write(bytearray(tile))
        if method == 1:
            if cnt > 0x100:
                raise ValueError("Compressed image overflowed!")

            for i in range(cnt, 0x100):
                f.write(b'\x00' * 32)
        elif method in [2,3,4]:
            if len(unique_tiles) >= 0x400:
                raise ValueError("Too many unique tiles!")

    with open(out_tsa, 'wb') as f:
        if method == 2:
            f.write(tsa_data.to_bytes())
        elif method in [3, 4]:
            f.write(tsa_data.to_bytes(with_dimensions = False))
        else:
            for entry in tsa_data:
                f.write(entry.to_bytes(2, byteorder='little'))
if __name__ == '__main__':
    main()