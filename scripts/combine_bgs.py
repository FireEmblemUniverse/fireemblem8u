import tool, os
import gfxtools.tsa2 as tsa

graphics_dir = "../graphics/btl_bg"
data_file = "../data/data_btl_bg.s"
paths = list(os.walk(graphics_dir))
paths = list(filter(lambda x : x.endswith(".4bpp"), paths[0][2]))
def convert_images():
    for p in paths:
        basePath = os.path.join(graphics_dir, p).replace(".4bpp", "")
        tool.save_image(basePath+".4bpp", basePath + ".png", 32, basePath + ".gbapal", basePath + ".bin")
        nomap = basePath +".png.nomap.png"
        if os.path.exists(nomap):
            os.remove(nomap)

def update_data():
    with open(data_file, "r") as f:
        text = f.read()

    for p in paths:
        p = os.path.join(graphics_dir, p.replace(".4bpp", "")).replace("../", "")
        text = text.replace(p+".bin.lz", p+".fetsa2.bin.lz")
        text = text.replace(p+".4bpp.lz", p+".feimg2.bin.lz")
    with open(data_file, "w") as f:
        f.write(text)
def reformat_battle_bg_tsa():
    for p in paths:
        p = os.path.join(graphics_dir, p.replace(".4bpp", ".bin"))

        with open(p, "rb") as f:
            data = f.read()
        if data[0] ==29: continue
        data = bytearray([29, 19]) + data
        with open(p, "wb") as f:
            f.write(data)

        read_tsa = tsa.read_file(p)
        read_tsa.tiles = read_tsa.order_chunks()
        with open(p, "wb") as f:
            f.write(read_tsa.to_bytes())
        p = 1
reformat_battle_bg_tsa()
convert_images()
update_data()