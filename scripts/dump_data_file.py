#!/usr/bin/env python3

import os, tool
#need to change "baserom.gba" to "../baserom.gba" in lzss_lib to run.
walk = os.walk("data")
rom = '../baserom.gba'

class Data():
    def __init__(self, lines):
        self.lines = lines
        self.name = self.lines[0].split(":")[0].strip()        
        line2 = lines[1].split(",")
        self.address = getAddress(lines[1])
        #idk if this is wrong lolol
        if("@" in line2[-1]):
            line2[-1] = line2[-1].split("@")[0]
        self.length = eval(line2[-1])
    def tsa(self):
        return [self.address, self.length]
    def __str__(self):
        return repr(self)
    def __repr__(self):
        return self.name
class GBAImage():
    def __init__(self, name, image=None, tsa=None, pal=None, width=None, height=None):
        self.name = name
        self.image = image
        self.tsa = tsa
        self.pal = pal
        self.width = width
        self.height = height
    def dump(self, rom, dir):
        self.dumpPal(rom, dir)
        self.dumpTSA(rom, dir)
        self.dumpImage(rom, dir)
    def dumpPal(self, rom, dir):    
        if self.pal == None: return 
        tool.dump_palette(rom,self.pal, name=self.getOut(dir))
    def dumpTSA(self, rom, dir):
        if(self.tsa == None):return
        data = tool.CompData(rom, self.tsa)
        with open(self.getOut(dir)+".bin", 'wb') as f:
            data.write_uncomp_data(f)
                
    def dumpImage(self, rom, dir):
        if self.image == None: return
        #tiles
        width =1 
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
            width=width
        )
    def getOut(self, dir):
        return os.path.join(dir, self.name)
def getAddress(line):
    line = line.split(",")
    return int(line[-2].strip(), 0)
def parseFile(path):
    out = []
    with open(path, "r") as file:
        text = file.readlines()
    for i in range(len(text)):
                row = text[i]
                if not "baserom.gba" in row: continue
                out.append(Data( text[i-1:i+1]))
    return out
def getDataPath(data, address, outdir):    
    for d in data:
        if d.image == address: return os.path.join(outdir, d.name+".4bpp.lz")  
        if d.tsa == address: return os.path.join(outdir, d.name+".bin.lz")
        if d.image == None and d.tsa == None and d.pal == address: return os.path.join(outdir, d.name+".gbapal")  
def rewriteDataFile(path, graphicsDir, data):
    with open(path, "r") as file:
        text = file.readlines()
    for i in range(len(text)):
        line = text[i]
        if not "baserom.gba" in line: continue
        prev = text[i-1]
        address = getAddress(line)
        itemPath = getDataPath(data, address, graphicsDir)
        text[i] = '\t.incbin "{}"\n'.format(itemPath)
        
    with open(path, "w") as file:
        file.writelines(text)
TO_REMOVE = [".gbapal"]
#extra pal files need to be removed manually :(
def tidyOutput(outDir):
    files = list(os.walk(outDir))[0]
    for f in files[2]:
        if any([remove in f for remove in TO_REMOVE]):
            os.remove(os.path.join(files[0], f))
    
dataPath = "../data/data_opsubtitle.s"
op = parseFile(dataPath)
images = [] 
outDir = "../graphics/op_subtitle"
images.append(GBAImage(op[0].name.replace("gPal_", ""), pal=op[0].address))#palette
for i in range(1,8):
    images.append(GBAImage(op[i].name.replace("gGfx_", ""), op[i].address, op[7+i].address,op[0].address, 1)) 
with open(rom, "rb") as rom_f:    
    for i in images:
        i.dump(rom_f, outDir)
tidyOutput(outDir)
rewriteDataFile(dataPath, outDir.replace("../", ""), images)