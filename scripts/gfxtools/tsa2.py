#!/bin/python3
import sys, enum
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
    def from_bytes(bin):
        out = TSA()
        out.width = bin[0] + 1
        out.height = bin[1] + 1
        out.tiles = []
        for i in range(2, len(bin), 2):
            out.tiles.append(Tile.from_bytes(bin[i:i+2]))
        return out
    def to_bytes(self): 
        out = bytearray([self.width-1, self.height-1])
        for t in self.tiles:
            out.extend(t.to_bytes())
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
        tileId = int(bytes[14:16]+bytes[:8], 2) 
        xFlip = bool(int(bytes[12], 2))
        yFlip = bool(int(bytes[13], 2))
        palId = int(bytes[8:12], 2)
        return Tile(tileId, xFlip, yFlip ,palId)
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
    tsa = [Tile(0, pal_id=unique_tiles[0].pal_id)]
    for t in tiles[1:]: 
        t = CheckTile(t)
        found = False
        
        for i in range(len(unique_tiles)):
            u = unique_tiles[i]
            orientation = u.get_orientation(t.original)
            if orientation != None:
                tsa_tile = Tile(i, pal_id=t.pal_id)
                tsa_tile.set_orientation(orientation)
                tsa.append(tsa_tile)
                found = True
                break
        if not found:
            unique_tiles.append(t)
            tsa_tile = Tile(len(unique_tiles)-1, pal_id=t.pal_id)
            tsa.append(tsa_tile)       
    out = []
    tsa.reverse()
    for i in range(0, len(tsa), ntile_x):
        chunk = tsa[i:i+ntile_x]
        chunk.reverse()
        out += chunk
    return TSA(ntile_x,ntile_y,out ), unique_tiles
def get_tiles(image: Image):
    img_width, img_height = image.size
    ntile_x = img_width //8
    ntile_y = img_height //8
    return extract_tiles(image, ntile_x, ntile_y).flatten()
def read_file(path):
    with open(path, "rb") as f: 
        tsa = TSA.from_bytes(f.read())
        out = ""
        for t in tsa.tiles:
            out += repr(t)+"\n"
        return out
def main(png_file, out_img, out_tsa ):
    im = Image.open(png_file)
    if im.mode != 'P': 
        raise ValueError("IMAGE ERROR (P mode)")
    tiles = get_tiles(im)
    img_width, img_height = im.size
    ntile_x = img_width //8
    ntile_y = img_height //8
    tsa, outTiles = create_TSA(tiles, ntile_x, ntile_y)
    tsa_bytes = tsa.to_bytes()    
    with open(out_tsa, "wb") as f:
        f.write(tsa_bytes)
    img_bytes = bytearray()
    for t in outTiles:
        img_bytes.extend(convert_to_4bpp(t.original.flatten()))
    with open(out_img, "wb") as f:
        f.write(img_bytes)

if __name__ == '__main__':
    from tsa_generator import convert_to_4bpp, extract_tiles
    args = sys.argv
    try:
        png_file = args[1]
        out_img  = args[2]
        out_tsa  = args[3]

    except IndexError:
        sys.exit(f"Usage: {args[0]} [*.png] [*.feimg2.bin] [*.fetsa2.bin]")
    main(png_file, out_img, out_tsa )
                
