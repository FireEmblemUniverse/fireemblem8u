import tool, os
import gfxtools.tsa2 as tsa

def convertBGS():
    paths = list(os.walk("../graphics/bg"))
    for p in paths[0][2]:
        
        if ".lz" in p: continue
        if  not ".4bpp" in p: continue

        basePath = os.path.join(paths[0][0], p).replace(".4bpp", "")    
        tool.save_image(basePath+".4bpp", basePath + ".png", 32, basePath + ".gbapal", basePath + ".bin")
        nomap = basePath +".png.nomap.png"
        if os.path.exists(nomap):
            os.remove(nomap)
convertBGS()