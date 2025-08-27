#!/bin/python3
import sys, enum
from PIL import Image
from tsa_generator import convert_to_4bpp
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
    def __init__(self, tileId, xflip = False, yflip = False, palid = 0):
        self.tileId = tileId              
        self.xFlip = xflip
        self.yFlip = yflip
        self.palId = palid
    def from_bytes(bytes):
        bytes  = prettyBin(int.from_bytes(bytes), 16)       
        #tttttttt pppp x y tt
        tileId = int(bytes[14:16]+bytes[:8], 2) 
        xFlip = bool(int(bytes[12], 2))
        yFlip = bool(int(bytes[13], 2))
        palId = int(bytes[8:12], 2)
        return Tile(tileId, xFlip, yFlip ,palId)
    def to_bytes(self) -> bytearray:
        if self.palId >= 16:
            raise ValueError("Too many colors!")
        if self.tileId >= 0x400:
            raise ValueError("Too many unique tiles!")
        
        byte1 = prettyBin(self.tileId, 10)
        byte2 = prettyBin(self.palId, 4)
        byte2 += str(int(self.xFlip))
        byte2 += str(int(self.yFlip))
        byte2 += byte1[:2]

        byte1 = byte1[2:]

        return bytearray([int(byte1, 2), int(byte2, 2)])
    def setOrientation(self, o:Orientation):
        match(o):
            case Orientation.N: self.xFlip = False; self.yFlip = False; return
            case Orientation.X: self.xFlip = True; self.yFlip =  False; return
            case Orientation.Y: self.xFlip = False; self.yFlip =  True; return
            case Orientation.XY: self.xFlip = True; self.yFlip =  True; return
        
    def __repr__(self):
        return "Id: {0} x: {1} y: {2} pal: {3}".format(self.tileId, self.xFlip, self.yFlip, self.palId)
    def __str__(self):
        return self.__repr__()

class CheckTile():
    def __init__(self, image):
        self.original = image
        self.x = self.original.transpose(method=Image.FLIP_TOP_BOTTOM)
        self.y = self.original.transpose(method=Image.FLIP_LEFT_RIGHT)
        self.xy = self.x.transpose(method=Image.FLIP_LEFT_RIGHT)


    def match(self, tile):
        return tile == self.original or tile == self.getX() or tile == self.getY() or tile ==  self.getXY()
    def getOrientation(self, tile):
        match(tile):
            case self.original: return Orientation.N       
            case self.x: return Orientation.X       
            case self.y: return Orientation.Y       
            case self.xy: return Orientation.XY               
def prettyBin(num, places = 0):
    return bin(num)[2:].rjust(places, "0")  
def imgcrop(im) -> list[CheckTile]:
    #https://stackoverflow.com/questions/5953373/how-to-split-image-into-multiple-pieces-in-python/62013714#62013714
    tiles = []
    imgwidth, imgheight = im.size
    xPieces = imgwidth // 8
    yPieces = imgheight // 8
    height = imgheight // yPieces
    width = imgwidth // xPieces
    for i in range(0, yPieces):
        for j in range(0, xPieces):
            box = (j * width, i * height, (j + 1) * width, (i + 1) * height)
            tiles.append(CheckTile(im.crop(box)))
    return tiles

def createTSA(im : Image) -> TSA:

    tiles = imgcrop(im)
    imgwidth, imgheight = im.size
    uniqueTiles = [tiles[0]]
    tsa = [Tile(0)]
    for t in tiles[1:]: 
        found = False
        for i in range(len(uniqueTiles)):
            u = uniqueTiles[i]
            orientation = u.getOrientation(t.original)
            if orientation != None:
                tsaTile = Tile(i)
                tsaTile.setOrientation(orientation)
                tsa.append(tsaTile)
                found = True
                break
        if not found:
            uniqueTiles.append(t)
            tsaTile = Tile(len(uniqueTiles)-1)
            tsa.append(tsaTile)
    
    tileWidth = imgwidth //8
    out = []
    tsa.reverse()
    for i in range(0, len(tsa), tileWidth):
        chunk = tsa[i:i+tileWidth]
        chunk.reverse()
        out += chunk
    return TSA(tileWidth, imgheight//8,out ), uniqueTiles
def readFile(path):
    with open(path, "rb") as f: 
        tsa = TSA.from_bytes(f.read())
        print("Width: " +str(tsa.width ))
        print("Height: " +str(tsa.height ))
        for t in tsa.tiles:
            print(t)
if __name__ == '__main__':
    args = sys.argv
    try:
        png_file = args[1]
        out_img  = args[2]
        out_tsa  = args[3]
    except IndexError:
        sys.exit(f"Usage: {args[0]} [*.png] [*.feimg2.bin] [*.fetsa2.bin]")
    im = Image.open(png_file)
    if im.mode != 'P':
        raise ValueError("IMAGE ERROR (P mode)")
    tsa, outTiles = createTSA(im)
    tsa_bytes = tsa.to_bytes()    
    with open(out_tsa, "wb") as f:
        f.write(tsa_bytes)
    img_bytes = bytearray()
    for t in outTiles:
        img_bytes.extend(convert_to_4bpp(np.array(t.original).flatten()))
    with open(out_img, "wb") as f:
        f.write(img_bytes)
        

                
