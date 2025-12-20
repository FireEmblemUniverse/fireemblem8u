#!/bin/python3
import sys, enum, os, argparse
from PIL import Image

import numpy as np
class Orientation(enum.Enum):
    N = 0 #not flipped
    X = 1
    Y = 2
    XY = 3

class TSA():
    def __init__(self, width=1, height=1, tiles = []):
        self.width = width
        self.height = height
        self.tiles = tiles
    def from_bytes(bin, with_dimensions=True):
        out = TSA()
        if with_dimensions:
            out.width = bin[0] + 1
            out.height = bin[1] + 1
        out.tiles = []
        for i in range(2 if with_dimensions else 0, len(bin), 2):
            out.tiles.append(Tile.from_bytes(bin[i:i+2]))
        return out
    def to_bytes(self, with_dimensions = True):
        if with_dimensions:
            out = bytearray([self.width-1, self.height-1])
        else:
            out = bytearray()
        for t in self.tiles:
            out.extend(t.to_bytes())
        return out
    def order_chunks(self):
        out = []
        tiles = list(reversed(self.tiles))
        for i in range(0, len(tiles), self.width):
            chunk = tiles[i:i+self.width]
            chunk.reverse()
            out += chunk
        return out

class Tile():
    def __init__(self, tile_id, x_flip = False, y_flip = False, pal_id = 0):
        self.tile_id = tile_id
        self.x_flip = x_flip
        self.y_flip = y_flip
        self.pal_id = pal_id
    def from_bytes(bytes):
        bytes  = pretty_binary(int.from_bytes(bytes, "big"), 16)
        #tttttttt pppp x y tt
        tile_id = int(bytes[14:16]+bytes[:8], 2)
        x_flip = bool(int(bytes[12], 2))
        y_flip = bool(int(bytes[13], 2))
        pal_id = int(bytes[8:12], 2)
        return Tile(tile_id, x_flip, y_flip ,pal_id)
    def to_bytes(self) -> bytearray:

        byte_1 = pretty_binary(self.tile_id, 10)
        byte_2 = pretty_binary(self.pal_id, 4)
        byte_2 += str(int(self.x_flip))
        byte_2 += str(int(self.y_flip))
        byte_2 += byte_1[:2]

        byte_1 = byte_1[2:]

        return bytearray([int(byte_1, 2), int(byte_2, 2)])
    def set_orientation(self, o:Orientation):
        match(o):
            case Orientation.N: self.x_flip = False; self.y_flip = False; return
            case Orientation.X: self.x_flip = True; self.y_flip =  False; return
            case Orientation.Y: self.x_flip = False; self.y_flip =  True; return
            case Orientation.XY: self.x_flip = True; self.y_flip =  True; return

    def __repr__(self):
        return "Id: {0} x: {1} y: {2} pal: {3}".format(self.tile_id, self.x_flip, self.y_flip, self.pal_id)
    def __str__(self):
        return self.__repr__()
    def __eq__(self, value):
        if not isinstance(value, Tile): return False
        return self.tile_id == value.tile_id and self.x_flip == value.x_flip and self.y_flip == value.y_flip# and self.pal_id == value.pal_id


class CheckTile():
    def __init__(self, tile):
        self.pal_id = tile[0]//16
        self.original = (tile-self.pal_id*16).reshape((8, 8))
        self.x = np.flip(self.original, axis=0)
        self.y = np.flip(self.original, axis=1)
        self.xy = np.flip(self.original)

    def get_orientation(self, tile):
        if (self.original == tile).all() : return Orientation.N
        if (self.x == tile).all() : return Orientation.X
        if (self.y == tile).all() : return Orientation.Y
        if (self.xy == tile).all() : return Orientation.XY
def pretty_binary(num, places = 0):
    return bin(num)[2:].rjust(places, "0")

def create_TSA(tiles, ntile_x, ntile_y) -> TSA:
    unique_tiles = [CheckTile(tiles[0])]
    tsa = [None]*ntile_x*ntile_y
    tsa[0] = Tile(0, pal_id=unique_tiles[0].pal_id)
    index = 1
    for t in tiles[1:]:
        t = CheckTile(t)
        found = False

        for i in range(len(unique_tiles)):
            u = unique_tiles[i]
            orientation = u.get_orientation(t.original)
            if orientation != None:
                tsa_tile = Tile(i, pal_id=t.pal_id)
                tsa_tile.set_orientation(orientation)
                tsa[index] = tsa_tile
                index+= 1
                found = True
                break
        if not found:
            unique_tiles.append(t)
            tsa_tile = Tile(len(unique_tiles)-1, pal_id=t.pal_id)
            tsa[index] = tsa_tile
            index += 1
    outTsa = TSA(ntile_x,ntile_y,tsa )
    return outTsa, unique_tiles

def handle_padding(padding: int, unique_tiles : list[CheckTile], tsa : TSA):
    if padding == 0: return
    #padding at start
    if padding < 0:
        padding = abs(padding)
        for i in range(padding):
            unique_tiles.insert(0, CheckTile(np.zeros((8,8), dtype=int)))
        for i in range(len(tsa.tiles)):
            if(tsa.tiles[i].tile_id != 1023):
                tsa.tiles[i].tile_id += padding
        return
    #padding at end
    for i in range(padding):
        unique_tiles.append(CheckTile(np.zeros((8,8), dtype=int)))
def handle_number_of_tiles(num_tiles: int, unique_tiles : list[CheckTile]):
    while len(unique_tiles) < num_tiles:
        unique_tiles.append(CheckTile(np.zeros((8,8), dtype=int)))
def handle_args(args : dict, unique_tiles, tsa):
    if args["max_empty_index"]:
        max_empty_tile(unique_tiles, tsa)
    if args["starting_index"] != 0: #TODO probably redundant with insert index now
        handle_starting_index(args["starting_index"], unique_tiles, tsa)
    if args["padding"] != 0:
        handle_padding(args["padding"], unique_tiles, tsa)
    if args["num_tiles"] != 0:
        handle_number_of_tiles(args["num_tiles"], unique_tiles)
    if args["blank_tile_index"] != 0:
        handle_blank_tile_index(args["blank_tile_index"], unique_tiles, tsa)
    if len(args["flip_y_indexes"]) > 0:
        handle_flip_indexes(args["flip_y_indexes"], tsa)
    if len(args["insert_indexes"]) > 0:
        unique_tiles = handle_insert_indexes(args["insert_indexes"], unique_tiles, tsa)
    if args["pop_last_tile"]:
        unique_tiles.pop(len(unique_tiles)-1)
    if args["no_chunked"] != True:
        tsa.tiles = tsa.order_chunks()

def shift_tiles_forward(old, new, tsa):
    tiles = tsa.tiles
    hit_index = False
    for i in range(len(tiles)):
        tile = tiles[i].tile_id
        if tile < old or tile == 1023: continue
        if tile == old:
            tiles[i].tile_id = new
            continue

        else:
            #shift tile forward
            new_id = tile - 1 + hit_index
        # if current tile is the starting tile everything after is shifted by another 1
        if new_id == new:
            new_id += 1
            hit_index = True
        tiles[i].tile_id = new_id
    tsa.tiles = tiles
    return tsa
def shift_tiles_back(old, new, tsa):
    tiles = tsa.tiles
    for i in range(len(tiles)):
        tile = tiles[i].tile_id
        if tile == 1023: continue
        if tile == old:
            tiles[i].tile_id = new
            continue
        if tile <= old:
            tiles[i].tile_id = tile + 1

        test = 1
    return tsa
def handle_insert_indexes(indexes : list[list[int, int]], unique_tiles : list[CheckTile], tsa : TSA):

    for new, old in indexes:
        #insert tile at new position
        unique_tiles.insert(new, unique_tiles.pop(old))
        if old < new:
            tsa = shift_tiles_forward(old, new, tsa)
        else:
            tsa = shift_tiles_back(old, new,tsa)
    return unique_tiles

def handle_flip_indexes(indexes : list[int], tsa: TSA):
    for i in indexes:
        tsa.tiles[i].y_flip = True
def handle_blank_tile_index(index : int, unique_tiles : list[CheckTile], tsa : TSA):
    for i in range(len(tsa.tiles)):
        if tsa.tiles[i].tile_id == 0:
            tsa.tiles[i].tile_id = index
    unique_tiles.insert(0, CheckTile(np.zeros((8,8), dtype=int)))

    unique_tiles.insert(index, unique_tiles.pop(1))

def handle_starting_index(index : int, unique_tiles : list[CheckTile], tsa : TSA):
    if index == 0: return
    #move tile at index to the start
    unique_tiles.insert(index, unique_tiles.pop(0))
    #shift tiles forward
    tiles = tsa.tiles
    hit_index = False
    for i in range(len(tiles)):
        tile = tiles[i].tile_id
        if tile == 0:
            tiles[i].tile_id = index
            continue
        else:
            #shift tile forward
            new_id = tile - 1 + hit_index
        # if current tile is the starting tile everything after is shifted by another 1
        if new_id == index:
            new_id += 1
            hit_index = True
        tiles[i].tile_id = new_id
    tsa.tiles = tiles

def max_empty_tile(unique_tiles : list[CheckTile],  tsa : TSA):

    #in the battle background the blank tiles are set as tile_id 1023 (max id)
    shift = True
    at_start = True
    current_tile_id = -1
    for i in range(len(tsa.tiles)):
        tile = tsa.tiles[i]
        if current_tile_id != 0 and current_tile_id == tile.tile_id:
            test = 1
        current_tile_id = tile.tile_id
        if tile.tile_id == 0:
            if tile.pal_id != 0:
                # if the first tile is an empty tile then nothing needs to be shifted as it would be empty anyway
                if at_start:
                    shift = False
                    continue
                else:
                    #use empty end tile if the empty tile is not the first tile
                    tsa.tiles[i].tile_id  = len(unique_tiles)-1
                    continue
            tsa.tiles[i].tile_id = 1023
            continue
        elif shift:
            tsa.tiles[i].tile_id -= 1
        at_start = False
    if shift:
        unique_tiles.pop(0)


def handle_index_sequence(sequence : list[int], unique_tiles : list[CheckTile], tsa : TSA):
   #TODO
   raise NotImplementedError()

def get_tiles(image: Image):
    img_width, img_height = image.size
    ntile_x = img_width //8
    ntile_y = img_height //8
    return extract_tiles(image, ntile_x, ntile_y).flatten()
def read_file(path, in_tile_order=False, with_dimensions=True) -> TSA:
    with open(path, "rb") as f:
        tsa = TSA.from_bytes(f.read(), with_dimensions)
    if in_tile_order:
        tsa.tiles = tsa.order_chunks()
    return tsa

def main(args, tiles , ntile_x, ntile_y ):

    tsa, out_tiles = create_TSA(tiles, ntile_x, ntile_y)
    handle_args(args,out_tiles, tsa )
    return tsa, out_tiles


if __name__ == '__main__':
    from tsa_generator import convert_to_4bpp, extract_tiles, get_args
    parser = get_args()
    try:
        args = parser.parse_args()
    except IndexError:
        sys.exit(parser.usage)

    png_file = args.png_file

    im = Image.open(png_file)
    if im.mode != 'P':
        raise ValueError("IMAGE ERROR (P mode)")
    tiles = get_tiles(im)
    img_width, img_height = im.size
    ntile_x = img_width //8
    ntile_y = img_height //8
    tsa, out_tiles = main(args.__dict__, tiles, ntile_x,  ntile_y )
    tsa_bytes = tsa.to_bytes()
    with open(args.out_tsa, "wb") as f:
        f.write(tsa_bytes)
    img_bytes = bytearray()
    for t in out_tiles:
        img_bytes.extend(convert_to_4bpp(t.original.flatten()))
    with open(args.out_img, "wb") as f:
        f.write(img_bytes)
