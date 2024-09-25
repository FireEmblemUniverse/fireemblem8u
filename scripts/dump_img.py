#!/bin/python3

import sys, struct, os
import array
import numpy as np
from PIL import Image
import lzss_lib

def read_palette_from_binary(pal_bytes):
    palette = []
    palette_len = len(pal_bytes)
    for i in range(0, palette_len, 2):
        color = struct.unpack('<H', pal_bytes[i:i+2])[0]
        r = (color & 0x1F) << 3 
        g = ((color >> 5) & 0x1F) << 3
        b = ((color >> 10) & 0x1F) << 3

        palette.append(r)
        palette.append(g)
        palette.append(b)

    return palette

def create_image_from_4bpp(img_data, tsa_data, pal_bytes, ntiles_x, ntiles_y):

    width  = ntiles_x * 8
    height = ntiles_y * 8
    img = Image.new('P', (width, height))

    pal_data = read_palette_from_binary(pal_bytes)

    tiles_8x8 = []

    pixels = [0] * (width * height)

    # step1: generate tiles
    for tile_idx in range(len(img_data) // 0x20):
        _tile = []

        for y in range(8):
            for x in range(0, 8, 2):
                offset = tile_idx * (8 * 8 // 2) + y * (8 // 2) + (x // 2)

                byte = img_data[offset]

                pixel1 = byte & 0x0F
                pixel2 = (byte >> 4) & 0x0F

                _tile.append(pixel1)
                _tile.append(pixel2)

        tiles_8x8.append(_tile)

    # apply TSA
    for tile_idx in range(ntiles_x * ntiles_y):
        base_y = tile_idx // ntiles_x
        base_x = tile_idx % ntiles_x

        tsa_idx = tsa_data[tile_idx]
        flip = tsa_idx & (3 << 10)
        tsa_idx_ext = tsa_idx & (0x3FF)
        tile = tiles_8x8[tsa_idx_ext]

        real_tile = tile
        if flip != 0:
            flip = flip >> 10
            tile_2d = np.array(tile).reshape((8, 8))
            if flip == 1:   # hf
                real_tile = np.flip(tile_2d, axis=1).flatten()
            elif flip == 2: # vf
                real_tile = np.flip(tile_2d, axis=0).flatten()
            elif flip == 3: # se
                real_tile = np.flip(tile_2d).flatten()

        for y in range(8):
            for x in range(0, 8):
                offset = y * (8 // 2) + (x // 2)

                real_x = x + base_x * 8
                real_y = y + base_y * 8

                pixels[real_x + 0 + real_y * width] = real_tile[y * 8 + x]

    img.putpalette(pal_data)
    img.putdata(pixels)
    return img

def dump_img(prefix, img_addr, tsa_addr, pal_addr, ntiles_x, ntiles_y):
    img_addr &= 0x00FFFFFF
    tsa_addr &= 0x00FFFFFF
    pal_addr &= 0x00FFFFFF

    pal_bytes = lzss_lib.copy_direct(pal_addr, 0x20)
    img_bytes = lzss_lib.lz77_decomp_data(img_addr)
    tsa_bytes = lzss_lib.lz77_decomp_data(tsa_addr)

    img_data = array.array('B', img_bytes)

    tsa_data = []
    for i in range(0, len(tsa_bytes), 2):
        tsa = struct.unpack('<H', tsa_bytes[i:i+2])[0]
        tsa_data.append(tsa)

    img = create_image_from_4bpp(img_data, tsa_data, pal_bytes, ntiles_x, ntiles_y)

    fpath = f"{prefix}.png"
    img.save(fpath)

def main(args):
    try:
        prefix   = args[1]
        img_addr = eval(args[2]) & 0x00FFFFFF
        tsa_addr = eval(args[3]) & 0x00FFFFFF
        pal_addr = eval(args[4]) & 0x00FFFFFF
        ntiles_x = eval(args[5])
        ntiles_y = eval(args[6])
    except IndexError:
        sys.exit(f"Usage: {args[0]} [prefix] [img_addr] [tsa_addr] [pal_addr] [ntiles_x] [ntiles_y]")

    dump_img(prefix, img_addr, tsa_addr, pal_addr, ntiles_x, ntiles_y)

if __name__ == '__main__':
    main(sys.argv)
