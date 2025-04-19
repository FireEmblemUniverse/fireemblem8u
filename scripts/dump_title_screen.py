#!/usr/bin/env python3

import tool, os

#need to change "baserom.gba" to "../baserom.gba" in lzss_lib to run.

outDir = "out"
if not os.path.isdir(outDir):
    os.makedirs(outDir)

rom = '../baserom.gba'

class GBAImage():
    def __init__(self, name, image=None, tsa=None, pal=None, width=None, height=None):
        self.name = name
        self.image = image
        self.tsa = tsa
        self.pal = pal
        self.width = width
        self.height = height

images = []
images.append(GBAImage("main_background", 0xAA7760,[0xAAAE90, 0x564],0xAAB3F4))
images.append(GBAImage("main_background_2", 0xAA9708,[]))
images.append(GBAImage("dragon_foreground", 0xAAB414,[0xAAC2A4,0x2E8],0xAAC58C))
images.append(GBAImage("press_start", 0xAACEDC))
images.append(GBAImage("demon_king", 0xAB0B44,[0xAB1890,0x374],0xAB1C04))
images.append(GBAImage("large_glowing_orb", 0xAB1C24,None, 0xAB210C, 32))
images.append(GBAImage("small_light_bubbles", 0xAB216C,None, 0xAB21B8, 4))
images.append(GBAImage("unk_palette_1", pal=0xAADBE8))
images.append(GBAImage("unk_palette_2", pal=0xAB212C))
images.append(GBAImage("unk_palette_3", pal=0xab214c))
images.append(GBAImage("unk_image_1", 0xAADC08, [0xAAE61C, 0x2B0], pal=0xAAE8CC))
images.append(GBAImage("unk_image_2", 0xAAE8EC, [0xAAF928, 0x3CC], pal=0xAAFCF4))
images.append(GBAImage("unk_image_3", 0xAAFD14, [0xAAFF10, 0x204], pal=0xAB0114))
images.append(GBAImage("unk_image_4", 0xAB0134, [0xAB0A20, 0x104], pal=0xAB0B24))

with open(rom, "rb") as rom_f:
    for image in images:
        outName = os.path.join(outDir, "title_" + image.name)

        #dump palette
        if image.pal != None:
            tool.dump_palette(rom_f,image.pal, name=outName)

        #tiles
        width =1 
        #sprite
        if image.width != None:
            width = image.width
        elif(image.tsa == None):
            wdith = 32 

        #dump tsa
        if(image.tsa != None and len(image.tsa) > 0):
            tool.dump_binary(rom_f, image.tsa[0], name=outName+"_tsa", size=image.tsa[1])

        if image.image == None: continue

        #dump image
        data = tool.CompData(rom_f, image.image) 
        with open(outName + '.4bpp', 'wb') as f:
            data.write_uncomp_data(f)
        tool.save_image(
            outName + '.4bpp',
            palfile=None if image.pal == None else outName+'.gbapal', 
            width=width
        )
                


            