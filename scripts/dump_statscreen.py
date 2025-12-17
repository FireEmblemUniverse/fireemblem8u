#!/bin/python3

import os
import tool
import json
from tmap2tsa import tsa2tmap

class GBAImage():
    def __init__(self, name, image=None, tsa=None, pal=None, width=None, height=None, palsCount=1, dumpTilemap=False, keepNomapDimensions=False):
        self.name = name
        self.image = image
        self.keepNomapDimensions = keepNomapDimensions
        self.tsa = tsa
        self.dumpTilemap = dumpTilemap
        self.pal = pal
        self.palsCount = palsCount
        self.width = width
        self.height = height

    def dump(self, rom, dir):
        self.dumpPal(rom, dir)
        self.dumpTSA(rom, dir)
        self.dumpImage(rom, dir)
        self.cleanupTmpFiles(dir)

    def dumpPal(self, rom, dir):
        if self.pal == None: return 
        tool.dump_palette(rom,self.pal, name=self.getOut(dir), color_number=16 * self.palsCount)

    def dumpTSA(self, rom, dir):
        if(self.tsa == None):return
        data = tool.CompData(rom, self.tsa)
        tsa_file_name = self.getOut(dir) + ".bin"
        with open(tsa_file_name, 'wb') as f:
            data.write_uncomp_data(f)
        if self.dumpTilemap:
            tm_file_name = self.getOut(dir) + ".tmap"
            with open(tsa_file_name, 'rb') as tsa_f, \
                    open(tm_file_name, 'wb') as tm_f, \
                        open(self.getOut(dir) + ".json", "w") as json_f:

                tsa2tmap(tm_f=tm_f,tsa_f=tsa_f,json_f=json_f, tm_file_name=tm_file_name)

    def dumpImage(self, rom, dir):
        if self.image == None: return
        #tiles
        width = 1
        #sprite
        if self.width != None:
            width = self.width
        elif(self.tsa != None):
            width = 32 
        outName = self.getOut(dir)
        data = tool.CompData(rom, self.image) 
        with open(outName + '.4bpp', 'wb') as f:
            data.write_uncomp_data(f)
        tool.save_image(
            outName + '.4bpp',
            palfile=None if self.pal == None else outName+'.gbapal',
            mapfile=None if self.palsCount == 1 else outName+'.bin',
            width=width,
            keepNomapDimensions=self.keepNomapDimensions
        )

    def getOut(self, dir):
        return os.path.realpath(os.path.join(dir, self.name))

    def cleanupTmpFiles(self, dir):
        pass
        if self.palsCount > 1:
            name = self.getOut(dir)
            os.unlink(name + ".png.nomap.png")
            os.unlink(name + ".gbapal.entry0.gbapal")

if __name__ == '__main__':
    rom = "baserom.gba"
    outDir = "./scripts/out"
    graphDir = "./graphics/statscreen"

    img_StatscreenBG = 0xA03368
    tsa_StatscreenBG = 0xA05F10
    pal_StatscreenBG = 0xA06460

    img_StatscreenHalo = 0xA064E0
    tsa_StatscreenHalo = 0xA071FC
    pal_StatscreenHalo = 0xA0731C

    images = [
        GBAImage("StatscreenHalo", img_StatscreenHalo, tsa_StatscreenHalo, pal_StatscreenHalo, width=1, dumpTilemap=True),
        GBAImage("StatscreenBG", img_StatscreenBG, tsa_StatscreenBG, pal_StatscreenBG, palsCount=4, dumpTilemap=True, keepNomapDimensions=True),
        GBAImage("StatscreenObjs", image=0xA02274,pal=0x5996F4+32, width=32),
        GBAImage("StatscreenEquipmentBG", image=0xA01F24,pal=0x5B6BB4, tsa=0xA02204, width=32, dumpTilemap=True),
        GBAImage("StatscreenEquipmentText", image=0xA020F0, pal=0xA021E4, width=8),
    ]
    with open(rom, "rb") as rom_f:
        for image in images:
            image.dump(rom_f, outDir)
    os.system(f"cp {outDir}/Statscreen*.png {outDir}/Statscreen*.tmap {graphDir}")
