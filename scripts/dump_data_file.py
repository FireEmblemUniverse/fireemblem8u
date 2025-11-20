#!/usr/bin/env python3

import os, tool, enum
#need to change "baserom.gba" to "../baserom.gba" in lzss_lib to run.
walk = os.walk("data")
rom = '../baserom.gba'

class DataType(enum.Enum):
    Img = 0
    Tsa = 1
    Pal = 2
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
    def getType(self):
        if("img_" in self.name.lower()):return DataType.Img
        if("tsa_" in self.name.lower()):return DataType.Tsa
        if("pal_" in self.name.lower()):return DataType.Pal
    def tsa(self):
        return [self.address, self.length]
    def __str__(self):
        return repr(self)
    def __repr__(self):
        return self.name
    TO_REMOVE = ["Tsa_", "Pal_", "Img_"]
    def basicName(self):
        out = self.name
        for i in Data.TO_REMOVE:
            out = out.replace(i, "")
            out = out.replace(i.lower(), "")
        return out
class GBAImage():
    def __init__(self, name, image=None, tsa=None, pal=None, width=None, height=None):
        self.name = name
        self.image = image
        self.tsa = tsa
        self.tsaLength = None
        self.pal = pal
        self.width = width
        self.height = height
        self.tsaCompressed = True
    def updateFromType(self, obj, type: DataType):
        match(type):
            case DataType.Img: self.image = obj; return
            case DataType.Tsa: self.tsa = obj ; return
            case DataType.Pal : self.pal = obj ; return
            case _: raise
    def dump(self, rom, dir):
        self.dumpPal(rom, dir)
        self.dumpTSA(rom, dir)
        self.dumpImage(rom, dir)
    def dumpPal(self, rom, dir):
        if self.pal == None: return
        tool.dump_palette(rom,self.pal, name=self.getOut(dir))
    def dumpTSA(self, rom, dir):
        if(self.tsa == None):return
        path = self.getOut(dir)
        if self.tsaLength <= 60 or self.tsaCompressed == False:
            self.tsaCompressed = False
            tool.dump_binary(rom, self.tsa, name=path, size=self.tsaLength)
            return
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
def getDataPath(data : list[GBAImage], address, outdir):
    for d in data:
        out = os.path.join(outdir, d.name)
        if d.image == address:
            out += ".4bpp.lz"
        elif d.tsa == address:
            out += ".bin"
            if d.tsaCompressed:
                out += ".lz"
        elif d.pal == address:
            out += ".gbapal"
        else: continue
        return out
def rewriteDataFile(path, graphicsDir, data):
    with open(path, "r") as file:
        text = file.readlines()
    for i in range(len(text)):
        line = text[i]
        if not "baserom.gba" in line: continue

        address = getAddress(line)
        itemPath = getDataPath(data, address, graphicsDir)
        if(itemPath == None) :continue
        text[i] = '\t.incbin "{}"\n'.format(itemPath)
        prev = text[i-1]
        prev = prev.split("@") [0]
        if not prev.endswith("\n"): prev += "\n"
        text[i-1] = prev
    with open(path, "w") as file:
        file.writelines(text)
TO_REMOVE = [".gbapal"]
def tidyOutput(outDir, imgs: list[GBAImage]):
    files = list(os.walk(outDir))[0]
    for f in files[2]:
        if any([remove in f for remove in TO_REMOVE]):
            os.remove(os.path.join(files[0], f))
        if ".pal" in f:
            for i in imgs:
                if i.pal ==  None: continue
                if i.image == None: continue
                if i.name +".pal" == f:
                    os.remove(os.path.join(files[0], f))
                    break
def autoMatchGraphics(data : list[Data]) -> list[GBAImage]:
    images = []

    while len(data) > 0:
        obj = data.pop(0)
        name = obj.basicName()
        type = obj.getType()
        if type == None: continue

        out = GBAImage(name, width =1)
        out.updateFromType(obj.address, type)
        if(type == DataType.Tsa):
             out.tsaLength = obj.length
        i = 0
        while  i < len(data):
            check = data[i]

            if(check.basicName() == name):
                t = check.getType()
                out.updateFromType(check.address, t)
                if(t == DataType.Tsa):
                    out.tsaLength = check.length

                data.pop(i)
                i -= 1
            i += 1
        #if out.image == None and out.pal == None:
        #    print(out.name +" only tsa")
        #    continue
        #if out.tsa == None and out.pal ==  None:
        #    print(out.name +" only image")
        #    continue
        images.append(out)
    return images




"""dataPath = "../data/data_opsubtitle.s"
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
rewriteDataFile(dataPath, outDir.replace("../", ""), images)"""

dataPath = "../data/data_opanim_gfx.s"
op = parseFile(dataPath)
matched = autoMatchGraphics(op)
outDir = "../graphics/op_anim"
with open(rom, "rb") as rom_f:
    for i in matched:
        if i.name.startswith("opanim"):
            i.tsaCompressed = False
        i.dump(rom_f, outDir)
tidyOutput(outDir, matched)
rewriteDataFile(dataPath,outDir.replace("../", ""), matched)
test = 1